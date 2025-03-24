# Use the official .NET SDK as the build image
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copy the project files and restore dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build the app
COPY . ./
RUN dotnet publish -c Release -o out

# Use the ASP.NET Core runtime as the base image
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/out .

# Expose the correct port (default is 8080)
EXPOSE 8080

# Start the application
ENTRYPOINT ["dotnet", "PaymentGateway.dll"]

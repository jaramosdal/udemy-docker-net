#Build
FROM mcr.microsoft.com/dotnet/sdk:5.0 as build
WORKDIR /app
COPY workerApp ./
RUN dotnet restore
RUN dotnet publish -c Release -o out

#Runtime
FROM mcr.microsoft.com/dotnet/runtime:5.0
WORKDIR /app
COPY --from=build /app/out ./
ENTRYPOINT ["dotnet", "workerApp.dll"]

# docker build -t workerapp:latest ./ -f "workerApp.dockerfile"
# docker run workerapp:latest
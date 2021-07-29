#Build
# build es un alias, lo usaremos en el runtime
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build 
WORKDIR /app
COPY webApp ./
RUN dotnet restore
# dotnet publish hace siempre un dotnet build previo. 
# -c Release = Modo de compilación en Release
# -o out = salida de la compilación en /app/out
RUN dotnet publish -c Release -o out

#Runtime
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build /app/out ./
EXPOSE 80
# Comando inicial que se ejecutará al ejecutarse el contendor
ENTRYPOINT ["dotnet", "webApp.dll"]





# docker build -t webapp:latest ./ -f "webApp.dockerfile"
# docker run -p 5000:80 webapp:latest
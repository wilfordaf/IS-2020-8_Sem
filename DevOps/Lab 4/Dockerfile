FROM alpine:3.14 AS system
RUN apk update && \
    apk add --no-cache bash

FROM mcr.microsoft.com/dotnet/sdk:7.0-alpine AS build
WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY Controllers ./Controllers
COPY *.cs ./
COPY *.json ./
COPY *.sln ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:7.0-alpine AS app
WORKDIR /app

COPY --from=build /app/out ./

EXPOSE 80
USER 1000:1000
ENV ASPNETCORE_ENVIRONMENT=Development

ENTRYPOINT ["dotnet", "Example.dll"]
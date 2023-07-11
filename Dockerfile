FROM ubuntu:22.04 as build-env
RUN apt-get update && apt-get install -y dotnet-sdk-6.0 ca-certificates
WORKDIR /src
COPY ZadanieDevProd/*.csproj .
RUN dotnet restore
COPY ZadanieDevProd .
RUN dotnet publish -c Debug -o /publish

FROM ubuntu:22.04 as runtime
RUN apt-get update && apt-get install -y aspnetcore-runtime-6.0
WORKDIR /publish
COPY --from=build-env /publish .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080
ENTRYPOINT ["dotnet", "ZadanieDevProd.dll", "--environment=Development"]
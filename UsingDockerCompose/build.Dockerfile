FROM microsoft/dotnet:2.1.500-sdk AS build-env
COPY . ./

WORKDIR /src

RUN dotnet restore
RUN dotnet publish -c Release -o /app

FROM microsoft/dotnet:2.1.6-aspnetcore-runtime
WORKDIR /app
COPY --from=build-env /app .

COPY ./build/newrelic ./newrelic
RUN dpkg -i ./newrelic/newrelic-netcore20-agent*.deb
ENV CORECLR_ENABLE_PROFILING=1 \
    CORECLR_PROFILER={36032161-FFC0-4B61-B559-F6C5D41BAE5A} \
    CORECLR_NEWRELIC_HOME=/usr/local/newrelic-netcore20-agent \
    CORECLR_PROFILER_PATH=/usr/local/newrelic-netcore20-agent/libNewRelicProfiler.so \
    NEW_RELIC_LICENSE_KEY=5373f689837de6b4e46672946880c9f727d238d8 \
    NEW_RELIC_APP_NAME=app

EXPOSE 80

ENTRYPOINT ["dotnet", "app.dll"]

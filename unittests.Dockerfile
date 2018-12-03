FROM microsoft/dotnet:2.1.500-sdk AS build-env
WORKDIR /test

COPY . .

ENTRYPOINT ["dotnet", "test", "UnitTests/UnitTests.csproj", "--logger:trx"]
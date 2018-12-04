# How to run the unit test

docker-compose -f docker-compose.yml run --rm unittests

## Sample output:

```console

The TAG variable is not set. Defaulting to a blank string.
Building unittests
Step 1/4 : FROM microsoft/dotnet:2.1.500-sdk AS build-env
 ---> 540aa875e6c2
Step 2/4 : WORKDIR /test
 ---> Running in 86e5c6c8e319
Removing intermediate container 86e5c6c8e319
 ---> 36a148edf620
Step 3/4 : COPY . .
 ---> 3873dc35ecc4
Step 4/4 : ENTRYPOINT ["dotnet", "test", "src/UnitTests/UnitTests.csproj", "--logger:trx"]
 ---> Running in 5f93d3b0ebd0
Removing intermediate container 5f93d3b0ebd0
 ---> e98547fbaf3a

Successfully built e98547fbaf3a
Successfully tagged dms2:unittest
Image for service unittests was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Build started, please wait...
Build completed.

Test run for /test/src/DMS2.UnitTests/bin/Debug/netcoreapp2.1/DMS2.UnitTests.dll(.NETCoreApp,Version=v2.1)
Microsoft (R) Test Execution Command Line Tool Version 15.9.0
Copyright (c) Microsoft Corporation.  All rights reserved.

Starting test execution, please wait...
Results File: /test/src/UnitTests/TestResults/_046829ba9f6f_2018-12-04_03_53_40.trx

Total tests: 1. Passed: 1. Failed: 0. Skipped: 0.
Test Run Successful.

```

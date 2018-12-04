# How to run the unit test

docker-compose -f docker-compose.yml run --rm unittests

Note: Refer to the unittests.dockerfile allocated outside of this directory.

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
Successfully tagged app:unittest
Image for service unittests was built because it did not already exist. To rebuild this image you must use `docker-compose build` or `docker-compose up --build`.
Build started, please wait...
Build completed.

Test run for /test/src/UnitTests/bin/Debug/netcoreapp2.1/UnitTests.dll(.NETCoreApp,Version=v2.1)
Microsoft (R) Test Execution Command Line Tool Version 15.9.0
Copyright (c) Microsoft Corporation.  All rights reserved.

Starting test execution, please wait...
Results File: /test/src/UnitTests/TestResults/_046829ba9f6f_2018-12-04_03_53_40.trx

Total tests: 1. Passed: 1. Failed: 0. Skipped: 0.
Test Run Successful.

```

# Docker Ignore

The docker ignore file to ignore the listed files/folders.  Without the docker ignore, we might be getting the following possible error:

```console

The TAG variable is not set. Defaulting to a blank string.
Building unittests
[24012] Failed to execute script docker-compose
Traceback (most recent call last):
  File "site-packages\docker\utils\build.py", line 96, in create_archive
PermissionError: [Errno 13] Permission denied: 'C:\\Users\\ronald.suharta\\source\\repos\\app\\src\\.vs\\app\\v15\\Server\\sqlite3\\db.lock'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "docker-compose", line 6, in <module>
  File "compose\cli\main.py", line 71, in main
  File "compose\cli\main.py", line 127, in perform_command
  File "compose\cli\main.py", line 845, in run
  File "compose\cli\main.py", line 1297, in run_one_off_container
  File "compose\service.py", line 316, in create_container
  File "compose\service.py", line 352, in ensure_image_exists
  File "compose\service.py", line 1067, in build
  File "site-packages\docker\api\build.py", line 154, in build
  File "site-packages\docker\utils\build.py", line 31, in tar
  File "site-packages\docker\utils\build.py", line 100, in create_archive
OSError: Can not read file in context: C:\Users\ronald.suharta\source\repos\app\src\.vs\app\v15\Server\sqlite3\db.lock

```

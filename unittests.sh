cp ./build/unittests.Dockerfile ./src/unittests.Dockerfile

docker build --no-cache ./src -f ./src/unittests.Dockerfile  -t "project:unittest"

# Allow build agent to perform clean build (removing the test results folder below)
mkdir -m777 "$(pwd)"/UnitTestResults

# The volume (-v) option mounts the test result (*.trx) file back to the host so that the build agent can read and display the test result
docker run --rm -v "$(pwd)"/UnitTestResults:/test/UnitTests/TestResults project:unittest

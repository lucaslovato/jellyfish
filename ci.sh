#!/bin/bash

set -ex

# check versions
dotnet --info
node --version
npm --version

# check for commited password
#test $(grep 'Password=' $(find . -name 'appsettings.json') | grep -v 'Password=dbpassword' | wc -l) -eq 0

# enter source directory
cd src

# enter WebApp directory
#cd webapp

#npm install

#npm test

#cd ..

# build all projects
dotnet build ConsoleApp/ConsoleApp.csproj -c Release

# fix connection strings
#./use-ci-conn-string

# apply migrations
# need to setup postgres on .yml file
#cd consoleapp
# ./migrate.sh

# run c# tests
cd Test
dotnet test --verbosity normal --no-restore --no-build

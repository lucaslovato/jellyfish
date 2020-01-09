#!/bin/bash

set -ex

# check versions
dotnet --info
node --version
npm --version
docker --version
docker-compose --version
# check for commited password
#test $(grep 'Password=' $(find . -name 'appsettings.json') | grep -v 'Password=dbpassword' | wc -l) -eq 0

# enter source directory
cd src

# enter WebApp directory
sudo npm install n

sudo n 9.11.1

cd WebApp

npm install

npm test

cd ..

# build all projects
dotnet build -c Release

# fix connection strings
#./use-ci-conn-string

# apply migrations
# need to setup postgres on .yml file
#cd consoleapp
# ./migrate.sh

# run c# tests
cd Test
dotnet test --verbosity normal

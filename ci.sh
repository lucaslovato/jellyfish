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

#up database
docker-compose -f docker-compose.test.yml up -d

# enter WebApp directory
sudo npm install n

sudo n 9.11.1

cd WebApp

sudo npm install

sudo npm test

cd ..

# build all projects
dotnet build ./ConsoleApp/ConsoleApp.csproj -c Release

# fix connection strings
#./use-ci-conn-string

# apply migrations
# need to setup postgres on .yml file
#cd ConsoleApp
#./migrate.sh
#cd ..

# run c# tests
cd Test
dotnet test --verbosity normal

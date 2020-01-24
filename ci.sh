#!/bin/bash

set -ex

# link the hostnames data_lake and analytics_platform to the localhost address
sudo /bin/bash -c 'echo -e "127.0.0.1 data_lake" >> /etc/hosts'
sudo /bin/bash -c 'echo -e "127.0.0.1 analytics_platform" >> /etc/hosts'

<<<<<<< HEAD
sudo apt-get install build-essential

git clone https://github.com/uncrustify/uncrustify.git \
    && cd uncrustify && git checkout "uncrustify-0.67" \
    && mkdir build && cd build \
    && cmake .. && make && make install \
    && cd ../../ && rm -rf uncrustify

=======
>>>>>>> 4dc2fdf6b22fa256af8c3fca1fbf198adf722021
# check versions
dotnet --info
docker --version
docker-compose --version
<<<<<<< HEAD
uncrustify --version
=======
>>>>>>> 4dc2fdf6b22fa256af8c3fca1fbf198adf722021

# enter source directory
cd src

<<<<<<< HEAD
#Uncrustify verification
uncrustify -c ../uncrustify.cfg --check $(find . -name '*.cs' | grep -v "Migrations")

=======
>>>>>>> 4dc2fdf6b22fa256af8c3fca1fbf198adf722021
# up databases
docker-compose -f docker-compose.test.yml up -d

# build all projects
dotnet build ./src.sln -c Release

# run c# tests
cd Test
dotnet test --verbosity normal
<<<<<<< HEAD

=======
>>>>>>> 4dc2fdf6b22fa256af8c3fca1fbf198adf722021

#!/bin/sh
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip
# unzip -d exa exa-linux-x86_64-v0.10.0.zip
mv exa-linux-x86_64-v0.10.0.zip exa.zip
sudo unzip -q exa.zip bin/exa -d /usr/local

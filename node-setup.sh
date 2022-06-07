#!/bin/sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
\. ${HOME}/.nvm/nvm.sh

nvm i 16.15.0
# Enable yarn
corepack enable

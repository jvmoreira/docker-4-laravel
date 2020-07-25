#!/bin/bash

echo Installing Node v${NODE_VERSION}...

mkdir -p /home/node/v${NODE_VERSION} \
    && cd /home/node/v${NODE_VERSION}

curl "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" -s \
    | tar -xz -C ./ --strip-components 1 && ln -fs /home/node/v${NODE_VERSION}/bin/* /usr/bin/

export NPM_CONFIG_PREFIX=/home/node/v${NODE_VERSION}
npm config set prefix "/home/node/v${NODE_VERSION}"
npm install npm@latest -g

echo Installation complete!

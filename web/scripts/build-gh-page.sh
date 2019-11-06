#!/usr/bin/env bash
npm run build
sed -i 's/=\//=/g' dist/index.html
cp -r dist ..

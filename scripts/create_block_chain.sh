#!/bin/bash
set -e
GENESIS=$1/t/genesis.blk
rm -fr $1
mkdir -p $1
mkdir -p $1/f # hashed Files
mkdir -p $1/t # Temp files
cp -rp $3/* $1
cp -rp $2 $GENESIS
sh scripts/create_block_dir.sh $1 0 genesis $GENESIS

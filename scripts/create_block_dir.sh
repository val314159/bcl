#!/bin/bash
set -e
mkdir -p $1/b/$2/$3
mkdir -p $1/b/$2/$3/i # Items / inside / info
mkdir -p $1/b/$2/$3/c # Code (this time)
mkdir -p $1/b/$2/$3/n # code (Next time)
mkdir -p $1/b/$2/$3/x # transaXions (next ones)
mkdir -p $1/b/$2/$3/b # Blocks (next ones)
mkdir -p $1/b/$2/$3/t # Temp files
mv  $4   $1/b/$2/$3/block.txt

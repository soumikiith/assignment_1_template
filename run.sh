#!/bin/bash

LLVM_BUILD_DIR=$1

if [[ -z "$1" ]]; then
	echo -e "Please provide path to LLVM Build Directory as first argument."
	echo -e "Usage: ./run.sh (PATH_to_llvm_build_directory). e.g. ./run.sh ../../llvm_project/build/"
	echo "Exiting..."
    	exit 0
fi
LLVM_OPT=""
OPT=$LLVM_OPT
CLANG=$LLVM_BUILD_DIR/bin/clang

OUT_DIR=./assign_C/output_IR

INP_DIR=./assign_C

mkdir -p $OUT_DIR

$CLANG $INP_DIR/file1.c -S -emit-llvm -o $OUT_DIR/file1.ll

# write the similar commands for remaining files to generate .ll files



# Write the commands to generate transformed IR files using -mem2reg. Please refer to https://llvm.org/docs/Passes.html#mem2reg-promote-memory-to-register.

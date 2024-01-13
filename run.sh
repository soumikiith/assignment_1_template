LLVM_BUILD_DIR=$1
if [[ -z "$1" ]]; then
    echo "Please provide LLVM_BUILD_DIR as 1st argument"
    echo "Exiting..."
    exit 0
fi
OPT=$LLVM_BUILD_DIR/bin/opt
CLANG=$LLVM_BUILD_DIR/bin/clang
OUT_DIR=./assign_C/output_IR
INP_DIR=./assign_C
mkdir -p $OUT_DIR

$CLANG $INP_DIR/file1.c -S -emit-llvm -o $OUT_DIR/file1.ll

# write the similar commands for remaining files to generate .ll files
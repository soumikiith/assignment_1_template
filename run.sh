export LLVM_INSTALL_DIR=$1

if [[ -z "$1" ]]; then
    echo "Please provide LLVM_INSTALL_DIR"
    echo "Exiting..."
    exit 0
fi

OPT=$LLVM_INSTALL_DIR/bin/opt
CLANG=$LLVM_INSTALL_DIR/bin/clang
OUT_DIR=./assign_C/output_IR
INP_DIR=./assign_C


$CLANG $INP_DIR/file1.c -S -emit-llvm -o $OUT_DIR/file1.ll

# SGX-GCC constants

# object file extension
OBJ_EXT := o

# make constants
GCC_PATH = ${PROJ_ROOT}sgx-musl/built/cross-compiler/x86_64-linux-musl/bin/
CC  = $(GCC_PATH)/x86_64-linux-musl-gcc
CXX = $(GCC_PATH)/x86_64-linux-musl-g++
LD  := ld
LDRELOC := -r
RANLIB := ranlib
CCFLAGS += -fPIC
LIB_DIRS += /usr/local/lib/
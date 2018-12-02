# SGX-GCC constants

# object file extension
OBJ_EXT := o

# make constants
CC  = scone-gcc 
CXX = scone-g++
LD  := ld
LDRELOC := -r
RANLIB := ranlib
CCFLAGS += -fPIC
LIB_DIRS += /usr/local/lib/

NAME := ocean
SRC := jacobcalc jacobcalc2 laplacalc linkup main multi slave1 slave2 subblock

VPATH := src:$(BUILD_DIR)

include Makefile.$(BUILD_TYPE)
include ../config.mk

all: headers $(BUILD_DIR)/$(NAME)
headers: decs.h

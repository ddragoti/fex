ifneq ($(strip $(NUM_THREADS)),1)
	CCFLAGS += -DENABLE_THREADS -DENABLE_PTHREADS -DUSE_THREADS=1 -DPARALLEL -DHAVE_THREADS=1
	LIBS += -pthread
endif

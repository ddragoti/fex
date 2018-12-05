#!/usr/bin/env bash

echo -n "How many times should I run?"
read numOfTimes

if [ $1 = "test" ]; then
    for i in $(seq 1 $numOfTimes);do
        echo blackscholes
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/blackscholes.log 1G /root/code/fex/build/parsec/blackscholes/scone_profiler/blackscholes  8 /data/inputs/parsec/blackscholes/in_4.txt prices.txt 
        echo bodytrack
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/bodytrack.log 1G /root/code/fex/build/parsec/bodytrack/scone_profiler/bodytrack  /data/inputs/parsec/bodytrack/sequenceB_1 4 1 4000 5 0 8 
        echo canneal
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/canneal.log 1G /root/code/fex/build/parsec/canneal/scone_profiler/canneal  8 15000 2000 /data/inputs/parsec/canneal/10.nets 6000 
        echo dedup
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/dedup.log 1G /root/code/fex/build/parsec/dedup/scone_profiler/dedup  -c -p -t 8 -i /data/inputs/parsec/dedup/test.dat -o output.dat.ddp  
        echo facesim
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/facesim.log 1G /root/code/fex/build/parsec/facesim/scone_profiler/facesim  -timing -threads 8 -data_dir /data/inputs/parsec/facesim/test/
        echo fluidanimate
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/fluidanimate.log 1G /root/code/fex/build/parsec/fluidanimate/scone_profiler/fluidanimate  8 500 /data/inputs/parsec/fluidanimate/in_5K.fluid out.fluid 
        echo streamcluster
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/streamcluster.log 1G /root/code/fex/build/parsec/streamcluster/scone_profiler/streamcluster  10 20 128 1000 200 5000 none output.txt 8 
        echo swaptions
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/swaptions.log 1G /root/code/fex/build/parsec/swaptions/scone_profiler/swaptions  -ns 128 -sm 100 -nt 8     
        echo x264
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/x264.log 1G /root/code/fex/build/parsec/x264/scone_profiler/x264  --quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 8 -o eledream.264 /data/inputs/parsec/x264/eledream_32x18_1.y4m 

    done

else
    for i in $(seq 1 $numOfTimes);do
            echo blackscholes
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/blackscholes.log 1G /root/code/fex/build/parsec/blackscholes/scone_profiler/blackscholes  8 /data/inputs/parsec/blackscholes/in_10M.txt prices.txt 
        echo bodytrack
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/bodytrack.log 1G /root/code/fex/build/parsec/bodytrack/scone_profiler/bodytrack  /data/inputs/parsec/bodytrack/sequenceB_261 4 261 4000 5 0 8 
        echo canneal
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/canneal.log 1G /root/code/fex/build/parsec/canneal/scone_profiler/canneal  8 15000 2000 /data/inputs/parsec/canneal/2500000.nets 6000 
        echo dedup
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/dedup.log 1G /root/code/fex/build/parsec/dedup/scone_profiler/dedup  -c -p -t 8 -i /data/inputs/parsec/dedup/FC-6-x86_64-disc1.iso -o output.dat.ddp 
        echo facesim
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/facesim.log 1G /root/code/fex/build/parsec/facesim/scone_profiler/facesim  -timing -threads 8 -data_dir /data/inputs/parsec/facesim/dev  
        echo fluidanimate
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/fluidanimate.log 1G /root/code/fex/build/parsec/fluidanimate/scone_profiler/fluidanimate  8 500 /data/inputs/parsec/fluidanimate/in_500K.fluid out.fluid 
        echo streamcluster
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/streamcluster.log 1G /root/code/fex/build/parsec/streamcluster/scone_profiler/streamcluster  10 20 128 1000000 200000 5000 none output.txt 8 
        echo swaptions
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/swaptions.log 1G /root/code/fex/build/parsec/swaptions/scone_profiler/swaptions  -ns 128 -sm 1000000 -nt 8     
        echo x264
        SCONE_HEAP=2560M time /root/code/fex/scone-perf/profiler/timer /tmp/x264.log 1G /root/code/fex/build/parsec/x264/scone_profiler/x264  --quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 8 -o eledream.264 /data/inputs/parsec/x264/eledream_1920x1080_512.y4m 
    done
fi
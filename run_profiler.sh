#!/usr/bin/env bash

mkdir /data/results/profiler

echo -n "How many times should I run?"
read numOfTimes

if [ $1 = "phoenix" ]; then
    for i in $(seq 1 $numOfTimes);do
        echo Run: $i
        time "/root/code/fex/scone-perf/profiler/timer /data/histogram.log 1G /root/code/fex/build/phoenix/histogram/scone_profiler/histogram /data/input/small.bmp" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/kmeans.log 1G /root/code/fex/build/phoenix/kmeans/scone_profiler/kmeans -d 5 -c 100 -p 30000 -s 30000 8" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/linear_regression.log 1G /root/code/fex/build/phoenix/linear_regression/scone_profiler/linear_regression  /data/input/key_file_100MB.txt 8" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/matrix_multiply.log 1G /root/code/fex/build/phoenix/matrix_multiply/scone_profiler/matrix_multiply 1500 1 8" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/pca.log 1G /root/code/fex/build/phoenix/pca/scone_profiler/pca -r 3000 -c 2500 -t 8" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/string_match.log 1G /root/code/fex/build/phoenix/string_match/scone_profiler/string_match /data/input/key_file_50MB.txt 8" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/word_count.log 1G /root/code/fex/build/phoenix/word_count/scone_profiler/word_count  /data/input/word_50MB.txt 10 8" >&1 | tee -a phoenix_experiments.txt
    done
elif [ $1 = "parsec" ]; then
    for i in $(seq 1 $numOfTimes);do
        echo Run: $i
        time "/root/code/fex/scone-perf/profiler/timer /data/blackscholes.log 1G /root/code/fex/build/parsec/blackscholes/scone_profiler/blackscholes  8 /data/in_10M.txt prices.txt" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/bodytrack.log 1G /root/code/fex/build/parsec/bodytrack/scone_profiler/bodytrack  /data/sequenceB_261 4 261 4000 5 0 8" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/canneal.log 1G /root/code/fex/build/parsec/canneal/scone_profiler/canneal  8 15000 2000 /data/2500000.nets 6000" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/dedup.log 1G /root/code/fex/build/parsec/dedup/scone_profiler/dedup  -c -p -t 8 -i /data/FC-6-x86_64-disc1.iso -o output.dat.ddp" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/facesim.log 1G /root/code/fex/build/parsec/facesim/scone_profiler/facesim  -timing -threads 8 -data_dir /data/dev" >&1 | tee -a parsec_experiments.txt
        #time "/root/code/fex/scone-perf/profiler/timer /data/ferret.log 1G /root/code/fex/build/parsec/ferret/scone_profiler/ferret  /data/corel lsh /data/queries 50 20 8 output.txt" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/fluidanimate.log 1G /root/code/fex/build/parsec/fluidanimate/scone_profiler/fluidanimate  8 500 /data/in_500K.fluid out.fluid" >&1 | tee -a parsec_experiments.txt
        #time "/root/code/fex/scone-perf/profiler/timer /data/raytrace.log 1G /root/code/fex/build/parsec/raytrace/scone_profiler/raytrace  /data/thai_statue.obj -automove -nthreads 8 -frames 200 -res 1920 1080" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/streamcluster.log 1G /root/code/fex/build/parsec/streamcluster/scone_profiler/streamcluster  10 20 128 1000000 200000 5000 none output.txt 8" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/swaptions.log 1G /root/code/fex/build/parsec/swaptions/scone_profiler/swaptions  -ns 128 -sm 1000000 -nt 8" >&1 | tee -a parsec_experiments.txt
        #time "/root/code/fex/scone-perf/profiler/timer /data/vips.log 1G /root/code/fex/build/parsec/vips/scone_profiler/vips  im_benchmark /data/orion_18000x18000.v output.v" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/x264.log 1G /root/code/fex/build/parsec/x264/scone_profiler/x264  --quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 8 -o eledream.264 /data/eledream_1920x1080_512.y4m" >&1 | tee -a parsec_experiments.txt
    done
else
        echo "Please enter a benchmark name (e.g. phoenix, parsec)"
fi

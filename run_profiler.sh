#!/usr/bin/env bash

mkdir /data/results/profiler

echo -n "How many times should I run?"
read numOfTimes

if [ $1 = "phoenix" ]; then
    for i in $(seq 1 $numOfTimes);do
        echo Run: $i
        echo histogram
        { time /root/code/fex/scone-perf/profiler/timer /tmp/histogram.log 1G /root/code/fex/build/phoenix/histogram/scone_profiler/histogram /data/inputs/phoenix/histogram/input/small.bmp ; } >> /data/results/profiler/phoenix_experiments.txt 2>&1
        echo kmeans
        { time /root/code/fex/scone-perf/profiler/timer /tmp/kmeans.log 1G /root/code/fex/build/phoenix/kmeans/scone_profiler/kmeans -d 5 -c 100 -p 30000 -s 30000 8 ; } >> /data/results/profiler/phoenix_experiments.txt 2>&1
        echo linear_regression
        { time /root/code/fex/scone-perf/profiler/timer /tmp/linear_regression.log 1G /root/code/fex/build/phoenix/linear_regression/scone_profiler/linear_regression  /data/inputs/phoenix/linear_regression/input/key_file_100MB.txt 8 ; } >> /data/results/profiler/phoenix_experiments.txt 2>&1
        echo matrix_multiply
        { time /root/code/fex/scone-perf/profiler/timer /tmp/matrix_multiply.log 1G /root/code/fex/build/phoenix/matrix_multiply/scone_profiler/matrix_multiply 1500 1 8 ; } >> /data/results/profiler/phoenix_experiments.txt 2>&1
        echo pca
        { time /root/code/fex/scone-perf/profiler/timer /tmp/pca.log 1G /root/code/fex/build/phoenix/pca/scone_profiler/pca -r 3000 -c 2500 -t 8 ; } >> /data/results/profiler/phoenix_experiments.txt 2>&1
        echo string_match
        { time /root/code/fex/scone-perf/profiler/timer /tmp/string_match.log 1G /root/code/fex/build/phoenix/string_match/scone_profiler/string_match /data/inputs/phoenix/string_match/input/key_file_50MB.txt 8 ; } >> /data/results/profiler/phoenix_experiments.txt 2>&1
        echo word_count
        { time /root/code/fex/scone-perf/profiler/timer /tmp/word_count.log 1G /root/code/fex/build/phoenix/word_count/scone_profiler/word_count  /data/inputs/phoenix/word_count/input/word_50MB.txt 10 8 ; } >> /data/results/profiler/phoenix_experiments.txt 2>&1
    done
elif [ $1 = "parsec" ]; then
    for i in $(seq 1 $numOfTimes);do
        echo Run: $i
        echo blackscholes
        { time /root/code/fex/scone-perf/profiler/timer /tmp/blackscholes.log 1G /root/code/fex/build/parsec/blackscholes/scone_profiler/blackscholes  8 /data/inputs/parsec/blackscholes/in_10M.txt prices.txt ; } >> parsec_experiments.txt 2>&1
        echo bodytrack
        { time /root/code/fex/scone-perf/profiler/timer /tmp/bodytrack.log 1G /root/code/fex/build/parsec/bodytrack/scone_profiler/bodytrack  /data/inputs/parsec/bodytrack/sequenceB_261 4 261 4000 5 0 8 ; } >> parsec_experiments.txt 2>&1
        echo canneal
        { time /root/code/fex/scone-perf/profiler/timer /tmp/canneal.log 1G /root/code/fex/build/parsec/canneal/scone_profiler/canneal  8 15000 2000 /data/inputs/parsec/canneal/2500000.nets 6000 ; } >> parsec_experiments.txt 2>&1
        echo dedup
        { time /root/code/fex/scone-perf/profiler/timer /tmp/dedup.log 1G /root/code/fex/build/parsec/dedup/scone_profiler/dedup  -c -p -t 8 -i /data/inputs/parsec/dedup/FC-6-x86_64-disc1.iso -o output.dat.ddp ; } >> parsec_experiments.txt 2>&1
        echo facesim
        { time /root/code/fex/scone-perf/profiler/timer /tmp/facesim.log 1G /root/code/fex/build/parsec/facesim/scone_profiler/facesim  -timing -threads 8 -data_dir /data/inputs/parsec/facesim/dev ; } >> parsec_experiments.txt 2>&1
        #echo ferret
        # { time /root/code/fex/scone-perf/profiler/timer /tmp/ferret.log 1G /root/code/fex/build/parsec/ferret/scone_profiler/ferret  /data/corel lsh /data/queries 50 20 8 output.txt ; } >> parsec_experiments.txt 2>&1
        echo fluidanimate
        { time /root/code/fex/scone-perf/profiler/timer /tmp/fluidanimate.log 1G /root/code/fex/build/parsec/fluidanimate/scone_profiler/fluidanimate  8 500 /data/inputs/parsec/fluidanimate/in_500K.fluid out.fluid ; } >> parsec_experiments.txt 2>&1
        #echo raytrace
        # { time /root/code/fex/scone-perf/profiler/timer /tmp/raytrace.log 1G /root/code/fex/build/parsec/raytrace/scone_profiler/raytrace  /data/thai_statue.obj -automove -nthreads 8 -frames 200 -res 1920 1080 ; } >> parsec_experiments.txt 2>&1
        echo streamcluster
        { time /root/code/fex/scone-perf/profiler/timer /tmp/streamcluster.log 1G /root/code/fex/build/parsec/streamcluster/scone_profiler/streamcluster  10 20 128 1000000 200000 5000 none output.txt 8 ; } >> parsec_experiments.txt 2>&1
        echo swaptions
        { time /root/code/fex/scone-perf/profiler/timer /tmp/swaptions.log 1G /root/code/fex/build/parsec/swaptions/scone_profiler/swaptions  -ns 128 -sm 1000000 -nt 8 ; } >> parsec_experiments.txt 2>&1
        echo vips
        # { time /root/code/fex/scone-perf/profiler/timer /tmp/vips.log 1G /root/code/fex/build/parsec/vips/scone_profiler/vips  im_benchmark /data/orion_18000x18000.v output.v ; } >> parsec_experiments.txt 2>&1
        echo x264
        { time /root/code/fex/scone-perf/profiler/timer /tmp/x264.log 1G /root/code/fex/build/parsec/x264/scone_profiler/x264  --quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 8 -o eledream.264 /data/inputs/parsec/x264/eledream_1920x1080_512.y4m ; } >> parsec_experiments.txt 2>&1
    done
else
        echo "Please enter a benchmark name (e.g. phoenix, parsec)"
fi

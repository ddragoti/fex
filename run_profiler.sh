#!/usr/bin/env bash

mkdir /data/results/profiler

echo -n "How many times should I run?"
read numOfTimes

if [ $1 = "phoenix" ]; then
    for i in $(seq 1 $numOfTimes);do
        echo Run: $i
        time "/root/code/fex/scone-perf/profiler/timer /data/histogram.log 1G {PROJ_ROOT}/build/phoenix/histogram/sconeprofiler/histogram /data/input/small.bmp" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/kmeans.log 1G {PROJ_ROOT}/build/phoenix/kmeans/sconeprofiler/kmeans -d 5 -c 100 -p 30000 -s 30000 8" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/linear_regression.log 1G {PROJ_ROOT}/build/phoenix/linear_regression/sconeprofiler/linear_regression  /data/input/key_file_100MB.txt 8" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/matrix_multiply.log 1G {PROJ_ROOT}/build/phoenix/matrix_multiply/sconeprofiler/matrix_multiply 1500 1 8" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/pca.log 1G {PROJ_ROOT}/build/phoenix/pca/sconeprofiler/pca -r 3000 -c 2500 -t 8" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/string_match.log 1G {PROJ_ROOT}/build/phoenix/string_match/sconeprofiler/string_match /data/input/key_file_50MB.txt 8" >&1 | tee -a phoenix_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/word_count.log 1G {PROJ_ROOT}/build/phoenix/word_count/sconeprofiler/word_count  /data/input/word_50MB.txt 10 8" >&1 | tee -a phoenix_experiments.txt
    done
elif [ $1 = "parsec" ]; then
    for i in $(seq 1 $numOfTimes);do
        echo Run: $i
        time "/root/code/fex/scone-perf/profiler/timer /data/blackscholes.log 1G {PROJ_ROOT}/build/parsec/blackscholes/sconeprofiler/blackscholes  8 /data/in_10M.txt prices.txt" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/bodytrack.log 1G {PROJ_ROOT}/build/parsec/bodytrack/sconeprofiler/bodytrack  /data/sequenceB_261 4 261 4000 5 0 8" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/canneal.log 1G {PROJ_ROOT}/build/parsec/canneal/sconeprofiler/canneal  8 15000 2000 /data/2500000.nets 6000" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/dedup.log 1G {PROJ_ROOT}/build/parsec/dedup/sconeprofiler/dedup  -c -p -t 8 -i /data/FC-6-x86_64-disc1.iso -o output.dat.ddp" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/facesim.log 1G {PROJ_ROOT}/build/parsec/facesim/sconeprofiler/facesim  -timing -threads 8 -data_dir /data/dev" >&1 | tee -a parsec_experiments.txt
        #time "/root/code/fex/scone-perf/profiler/timer /data/ferret.log 1G {PROJ_ROOT}/build/parsec/ferret/sconeprofiler/ferret  /data/corel lsh /data/queries 50 20 8 output.txt" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/fluidanimate.log 1G {PROJ_ROOT}/build/parsec/fluidanimate/sconeprofiler/fluidanimate  8 500 /data/in_500K.fluid out.fluid" >&1 | tee -a parsec_experiments.txt
        #time "/root/code/fex/scone-perf/profiler/timer /data/raytrace.log 1G {PROJ_ROOT}/build/parsec/raytrace/sconeprofiler/raytrace  /data/thai_statue.obj -automove -nthreads 8 -frames 200 -res 1920 1080" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/streamcluster.log 1G {PROJ_ROOT}/build/parsec/streamcluster/sconeprofiler/streamcluster  10 20 128 1000000 200000 5000 none output.txt 8" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/swaptions.log 1G {PROJ_ROOT}/build/parsec/swaptions/sconeprofiler/swaptions  -ns 128 -sm 1000000 -nt 8" >&1 | tee -a parsec_experiments.txt
        #time "/root/code/fex/scone-perf/profiler/timer /data/vips.log 1G {PROJ_ROOT}/build/parsec/vips/sconeprofiler/vips  im_benchmark /data/orion_18000x18000.v output.v" >&1 | tee -a parsec_experiments.txt
        time "/root/code/fex/scone-perf/profiler/timer /data/x264.log 1G {PROJ_ROOT}/build/parsec/x264/sconeprofiler/x264  --quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 8 -o eledream.264 /data/eledream_1920x1080_512.y4m" >&1 | tee -a parsec_experiments.txt
    done
else
        echo "Please enter a benchmark name (e.g. phoenix, parsec)"
fi

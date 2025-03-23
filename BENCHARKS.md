```
Benchmarking for n = 4194304 bytes
  Run 1: 71 ms
  Run 2: 91 ms
  Run 3: 69 ms
  Run 4: 69 ms
  Run 5: 71 ms
Average time for n = 4194304: 74 ms
-----------------------------------------
Benchmarking for n = 8388608 bytes
  Run 1: 93 ms
  Run 2: 74 ms
  Run 3: 73 ms
  Run 4: 84 ms
  Run 5: 86 ms
Average time for n = 8388608: 82 ms
-----------------------------------------
Benchmarking for n = 16777216 bytes
  Run 1: 80 ms
  Run 2: 92 ms
  Run 3: 92 ms
  Run 4: 81 ms
  Run 5: 79 ms
Average time for n = 16777216: 85 ms
-----------------------------------------
Benchmarking for n = 33554432 bytes
  Run 1: 95 ms
  Run 2: 104 ms
  Run 3: 92 ms
  Run 4: 106 ms
  Run 5: 93 ms
Average time for n = 33554432: 98 ms
-----------------------------------------
Benchmarking for n = 67108864 bytes
  Run 1: 120 ms
  Run 2: 120 ms
  Run 3: 119 ms
  Run 4: 119 ms
  Run 5: 131 ms
Average time for n = 67108864: 122 ms
-----------------------------------------
Benchmarking for n = 134217728 bytes
  Run 1: 184 ms
  Run 2: 171 ms
  Run 3: 173 ms
  Run 4: 184 ms
  Run 5: 186 ms
Average time for n = 134217728: 180 ms
-----------------------------------------
Benchmarking for n = 268435456 bytes
  Run 1: 287 ms
  Run 2: 290 ms
  Run 3: 288 ms
  Run 4: 307 ms
  Run 5: 316 ms
Average time for n = 268435456: 298 ms
-----------------------------------------
Benchmarking for n = 536870912 bytes
  Run 1: 494 ms
  Run 2: 504 ms
  Run 3: 500 ms
  Run 4: 508 ms
  Run 5: 498 ms
Average time for n = 536870912: 501 ms
-----------------------------------------
Benchmarking for n = 1073741824 bytes
  Run 1: 927 ms
  Run 2: 935 ms
  Run 3: 927 ms
  Run 4: 908 ms
  Run 5: 908 ms
Average time for n = 1073741824: 921 ms
-----------------------------------------
Benchmarking for n = 2147483648 bytes
  Run 1: 1879 ms
  Run 2: 1841 ms
  Run 3: 1798 ms
  Run 4: 1757 ms
  Run 5: 1949 ms
Average time for n = 2147483648: 1845 ms
-----------------------------------------
Benchmarking for n = 4294967296 bytes
  Run 1: 3469 ms
  Run 2: 3370 ms
  Run 3: 3381 ms
  Run 4: 3407 ms
  Run 5: 3378 ms
Average time for n = 4294967296: 3401 ms
-----------------------------------------
Benchmarking for n = 4194304 bytes
  Run 1: 71 ms
  Run 2: 91 ms
  Run 3: 69 ms
  Run 4: 69 ms
  Run 5: 71 ms
Average time for n = 4194304: 74 ms
-----------------------------------------
Benchmarking for n = 8388608 bytes
  Run 1: 93 ms
  Run 2: 74 ms
  Run 3: 73 ms
  Run 4: 84 ms
  Run 5: 86 ms
Average time for n = 8388608: 82 ms
-----------------------------------------
Benchmarking for n = 16777216 bytes
  Run 1: 80 ms
  Run 2: 92 ms
  Run 3: 92 ms
  Run 4: 81 ms
  Run 5: 79 ms
Average time for n = 16777216: 85 ms
-----------------------------------------
Benchmarking for n = 33554432 bytes
  Run 1: 95 ms
  Run 2: 104 ms
  Run 3: 92 ms
  Run 4: 106 ms
  Run 5: 93 ms
Average time for n = 33554432: 98 ms
-----------------------------------------
Benchmarking for n = 67108864 bytes
  Run 1: 120 ms
  Run 2: 120 ms
  Run 3: 119 ms
  Run 4: 119 ms
  Run 5: 131 ms
Average time for n = 67108864: 122 ms
-----------------------------------------
Benchmarking for n = 134217728 bytes
  Run 1: 184 ms
  Run 2: 171 ms
  Run 3: 173 ms
  Run 4: 184 ms
  Run 5: 186 ms
Average time for n = 134217728: 180 ms
-----------------------------------------
Benchmarking for n = 268435456 bytes
  Run 1: 287 ms
  Run 2: 290 ms
  Run 3: 288 ms
  Run 4: 307 ms
  Run 5: 316 ms
Average time for n = 268435456: 298 ms
-----------------------------------------
Benchmarking for n = 536870912 bytes
  Run 1: 494 ms
  Run 2: 504 ms
  Run 3: 500 ms
  Run 4: 508 ms
  Run 5: 498 ms
Average time for n = 536870912: 501 ms
-----------------------------------------
Benchmarking for n = 1073741824 bytes
  Run 1: 927 ms
  Run 2: 935 ms
  Run 3: 927 ms
  Run 4: 908 ms
  Run 5: 908 ms
Average time for n = 1073741824: 921 ms
-----------------------------------------
Benchmarking for n = 2147483648 bytes
  Run 1: 1879 ms
  Run 2: 1841 ms
  Run 3: 1798 ms
  Run 4: 1757 ms
  Run 5: 1949 ms
Average time for n = 2147483648: 1845 ms
-----------------------------------------
Benchmarking for n = 4294967296 bytes
  Run 1: 3469 ms
  Run 2: 3370 ms
  Run 3: 3381 ms
  Run 4: 3407 ms
  Run 5: 3378 ms
Average time for n = 4294967296: 3401 ms
-----------------------------------------
Benchmarking for n = 8589934592 bytes
  Run 1: 10180 ms
  Run 2: 6742 ms
  Run 3: 6752 ms
  Run 4: 6719 ms
  Run 5: 6705 ms
Average time for n = 8589934592: 7420 ms
-----------------------------------------
```

```
#!/usr/bin/bash

iterations=5

for exp in {22..33}; do
  n=$((2**exp))
  echo "Benchmarking for n = $n bytes"

  count=$(( n / 1024 ))
  
  dd if=/dev/random bs=1024 count=$count of=g status=none

  total_time=0

  for ((i=1; i<=iterations; i++)); do
    TIMEFORMAT='%R'
    exec_time=$( { time echo 123 | mix-lite g -Po > /dev/null; } 2>&1 )
    
    ms=$(awk "BEGIN {printf \"%.0f\", $exec_time * 1000}")
    
    total_time=$(awk "BEGIN {printf \"%.0f\", $total_time + $ms}")
    
    echo "  Run $i: ${ms} ms"
  done

  avg=$(awk "BEGIN {printf \"%.0f\", $total_time / $iterations}")
  echo "Average time for n = $n: ${avg} ms"
  echo "-----------------------------------------"
done
```

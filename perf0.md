# Default VS logarithmic offset tree performance

Information about the tests:
- measured: time of socket `write` + `read` of batched 1000 requests (no connectors used);
- request count: 1M
- test count: 10-100, depends on the batch size;
- key: `{unsigned}`;
- dataset: random with linear distribution;
- WAL: on;
- buid type: `RelWithDebInfo`;
- compiler: GCC 13.


## Current BPS tree

| request | stat       | mean (old/new)      | diff                      | mean disp% | mean stdev% |
| ------- | ---------- | ------------------- | ------------------------- | ---------- | ----------- |
| insert  | RPS        | 977327.35/948136.03 | $\color{red}-2.99％$       | 11.85      | 3.54        |
|         | Avg (μs)   | 1.02/1.06           | $\color{red}+3.08％$       | 2.59       | 3.89        |
|         | Med (μs)   | 1.02/1.05           | $\color{red}+3.23％$       | 2.30       | 0.73        |
|         | Min (μs)   | 0.90/0.91           | $\color{RedOrange}+1.33％$ | 2.64       | 1.10        |
|         | 90% (μs)   | 1.04/1.07           | $\color{red}+3.07％$       | 1.50       | 0.64        |
|         | 99% (μs)   | 1.05/1.09           | $\color{red}+3.11％$       | 2.08       | 1.55        |
|         | 99.9% (μs) | 1.14/1.46           | $\color{red}+28.50％$      | 17.69      | 112.30      |
| select  | RPS        | 831811.45/808206.42 | $\color{red}-2.84％$       | 0.99       | 0.43        |
|         | Avg (μs)   | 1.20/1.24           | $\color{red}+2.92％$       | 0.80       | 0.43        |
|         | Med (μs)   | 1.22/1.25           | $\color{red}+3.05％$       | 0.83       | 0.43        |
|         | Min (μs)   | 0.95/0.96           | $\color{RedOrange}+1.79％$ | 1.73       | 0.68        |
|         | 90% (μs)   | 1.23/1.27           | $\color{red}+3.03％$       | 0.83       | 0.44        |
|         | 99% (μs)   | 1.25/1.29           | $\color{red}+3.47％$       | 0.85       | 0.47        |
|         | 99.9% (μs) | 1.28/1.32           | $\color{red}+3.08％$       | 2.28       | 2.78        |
| replace | RPS        | 988631.04/959489.85 | $\color{red}-2.95％$       | 1.20       | 0.61        |
|         | Avg (μs)   | 1.01/1.04           | $\color{red}+3.04％$       | 1.46       | 0.61        |
|         | Med (μs)   | 1.02/1.05           | $\color{red}+3.07％$       | 1.44       | 0.60        |
|         | Min (μs)   | 0.90/0.91           | $\color{RedOrange}+1.68％$ | 2.97       | 1.02        |
|         | 90% (μs)   | 1.04/1.07           | $\color{red}+2.90％$       | 1.69       | 0.65        |
|         | 99% (μs)   | 1.05/1.08           | $\color{red}+2.89％$       | 1.73       | 0.68        |
|         | 99.9% (μs) | 1.06/1.09           | $\color{red}+2.87％$       | 1.88       | 0.79        |
| delete  | RPS        | 859084.67/837045.11 | $\color{red}-2.57％$       | 3.20       | 0.54        |
|         | Avg (μs)   | 1.16/1.19           | $\color{red}+2.63％$       | 0.76       | 0.55        |
|         | Med (μs)   | 1.18/1.21           | $\color{red}+2.79％$       | 0.77       | 0.44        |
|         | Min (μs)   | 0.92/0.93           | $\color{RedOrange}+1.59％$ | 1.50       | 0.74        |
|         | 90% (μs)   | 1.20/1.23           | $\color{red}+2.79％$       | 0.78       | 0.44        |
|         | 99% (μs)   | 1.21/1.25           | $\color{red}+2.86％$       | 1.04       | 2.19        |
|         | 99.9% (μs) | 1.33/1.32           | $\color{green}-0.69％$     | 5.78       | 29.48       |

## After tarantool/tarantool#10183

| request | stat       | old       | new       | diff                      | stdev |
| ------- | ---------- | --------- | --------- | ------------------------- | ----- |
| insert  | RPS        | 953798.71 | 947070.48 | $\color{RedOrange}-0.71％$ | 0.58% |
|         | Avg (μs)   | 1.05      | 1.06      | $\color{RedOrange}+0.72％$ | 0.58% |
|         | Med (μs)   | 1.06      | 1.07      | $\color{RedOrange}+0.93％$ | 0.61% |
|         | Min (μs)   | 0.90      | 0.91      | $\color{RedOrange}+0.90％$ | 0.97% |
|         | 90% (μs)   | 1.09      | 1.10      | $\color{RedOrange}+0.86％$ | 0.57% |
|         | 99% (μs)   | 1.10      | 1.11      | $\color{RedOrange}+0.83％$ | 0.56% |
|         | 99.9% (μs) | 1.13      | 1.16      | $\color{red}+2.73％$       | 4.63% |
| select  | RPS        | 805361.94 | 796841.79 | $\color{RedOrange}-1.06％$ | 0.26% |
|         | Avg (μs)   | 1.24      | 1.25      | $\color{RedOrange}+1.07％$ | 0.26% |
|         | Med (μs)   | 1.26      | 1.27      | $\color{RedOrange}+0.96％$ | 0.25% |
|         | Min (μs)   | 0.95      | 0.95      | $\color{RedOrange}+0.41％$ | 0.54% |
|         | 90% (μs)   | 1.28      | 1.30      | $\color{RedOrange}+1.10％$ | 0.29% |
|         | 99% (μs)   | 1.34      | 1.37      | $\color{red}+2.08％$       | 1.15% |
|         | 99.9% (μs) | 1.58      | 1.72      | $\color{red}+8.86％$       | 8.82% |
| replace | RPS        | 953764.82 | 945705.59 | $\color{RedOrange}-0.84％$ | 0.80% |
|         | Avg (μs)   | 1.05      | 1.06      | $\color{RedOrange}+0.87％$ | 0.84% |
|         | Med (μs)   | 1.06      | 1.07      | $\color{RedOrange}+0.93％$ | 0.62% |
|         | Min (μs)   | 0.90      | 0.91      | $\color{RedOrange}+0.86％$ | 1.06% |
|         | 90% (μs)   | 1.09      | 1.10      | $\color{RedOrange}+0.80％$ | 0.55% |
|         | 99% (μs)   | 1.10      | 1.11      | $\color{RedOrange}+0.79％$ | 0.54% |
|         | 99.9% (μs) | 1.13      | 1.17      | $\color{red}+3.35％$       | 4.68% |
| delete  | RPS        | 833315.10 | 822460.84 | $\color{RedOrange}-1.30％$ | 0.25% |
|         | Avg (μs)   | 1.20      | 1.22      | $\color{RedOrange}+1.31％$ | 0.25% |
|         | Med (μs)   | 1.22      | 1.23      | $\color{RedOrange}+1.21％$ | 0.24% |
|         | Min (μs)   | 0.91      | 0.92      | $\color{RedOrange}+0.78％$ | 0.56% |
|         | 90% (μs)   | 1.24      | 1.26      | $\color{RedOrange}+1.37％$ | 0.27% |
|         | 99% (μs)   | 1.29      | 1.33      | $\color{red}+2.62％$       | 1.11% |
|         | 99.9% (μs) | 1.56      | 1.73      | $\color{red}+11.41％$      | 9.18% |

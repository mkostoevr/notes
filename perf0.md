# Default VS logarithmic offset tree performance

Information about the tests:
- measured: time of socket `write` + `read` of request or batch (no connectors used);
- request count: 1M
- test count: 10-100, depends on the batch size;
- key: `{unsigned}`;
- dataset: random with linear distribution;
- WAL: on;
- buid type: `RelWithDebInfo`;
- compiler: GCC 13.

## Single requests

| request | stat               | mean (old/new)    | diff                      | mean disp% | mean stdev% |
| ------- | ------------------ | ----------------- | ------------------------- | ---------- | ----------- |
| insert  | Request per second | 18687.24/18614.60 | $\color{green}-0.39％$     | 0.45       | 0.20        |
|         | Avg (μs)           | 53.51/53.72       | $\color{RedOrange}+0.39％$ | 0.32       | 0.20        |
|         | Med (μs)           | 53.06/53.18       | $\color{RedOrange}+0.22％$ | 0.21       | 0.12        |
|         | Min (μs)           | 46.97/47.11       | $\color{RedOrange}+0.32％$ | 1.08       | 0.63        |
|         | 90% (μs)           | 55.05/55.33       | $\color{RedOrange}+0.50％$ | 0.57       | 0.30        |
|         | 99% (μs)           | 58.12/58.59       | $\color{RedOrange}+0.81％$ | 0.84       | 0.46        |
|         | 99.9% (μs)         | 60.85/61.68       | $\color{RedOrange}+1.37％$ | 2.03       | 1.17        |
| select  | Request per second | 18594.22/18546.30 | $\color{green}-0.26％$     | 0.39       | 0.21        |
|         | Avg (μs)           | 53.78/53.92       | $\color{RedOrange}+0.26％$ | 0.40       | 0.21        |
|         | Med (μs)           | 53.33/53.38       | $\color{RedOrange}+0.09％$ | 0.31       | 0.17        |
|         | Min (μs)           | 47.32/47.38       | $\color{RedOrange}+0.11％$ | 1.06       | 0.65        |
|         | 90% (μs)           | 55.31/55.52       | $\color{RedOrange}+0.37％$ | 0.57       | 0.30        |
|         | 99% (μs)           | 58.41/58.77       | $\color{RedOrange}+0.61％$ | 0.89       | 0.50        |
|         | 99.9% (μs)         | 61.23/62.02       | $\color{RedOrange}+1.29％$ | 2.14       | 1.35        |
| replace | Request per second | 18692.84/18640.90 | $\color{green}-0.28％$     | 0.43       | 0.20        |
|         | Avg (μs)           | 53.50/53.65       | $\color{RedOrange}+0.28％$ | 0.38       | 0.20        |
|         | Med (μs)           | 53.05/53.13       | $\color{RedOrange}+0.16％$ | 0.27       | 0.15        |
|         | Min (μs)           | 46.97/47.06       | $\color{RedOrange}+0.19％$ | 0.93       | 0.49        |
|         | 90% (μs)           | 55.00/55.23       | $\color{RedOrange}+0.42％$ | 0.72       | 0.32        |
|         | 99% (μs)           | 58.13/58.51       | $\color{RedOrange}+0.65％$ | 0.95       | 0.52        |
|         | 99.9% (μs)         | 61.31/61.91       | $\color{RedOrange}+0.97％$ | 2.55       | 2.65        |
| delete  | Request per second | 18615.14/18592.20 | $\color{green}-0.12％$     | 0.53       | 0.18        |
|         | Avg (μs)           | 53.72/53.79       | $\color{RedOrange}+0.12％$ | 0.27       | 0.18        |
|         | Med (μs)           | 53.26/53.26       | $\color{green}-0.01％$     | 0.25       | 0.14        |
|         | Min (μs)           | 47.19/47.34       | $\color{RedOrange}+0.32％$ | 0.83       | 0.48        |
|         | 90% (μs)           | 55.25/55.38       | $\color{RedOrange}+0.23％$ | 0.74       | 0.26        |
|         | 99% (μs)           | 58.39/58.70       | $\color{RedOrange}+0.54％$ | 1.16       | 0.50        |
|         | 99.9% (μs)         | 61.37/61.99       | $\color{RedOrange}+1.02％$ | 2.47       | 1.71        |

## Batched (10 requests)

| request | stat               | mean (old/new)      | diff                      | mean disp% | mean stdev% |
| ------- | ------------------ | ------------------- | ------------------------- | ---------- | ----------- |
| insert  | Request per second | 153706.02/152401.84 | $\color{green}-0.85％$     | 1.26       | 0.41        |
|         | Avg (μs)           | 6.51/6.56           | $\color{RedOrange}+0.85％$ | 0.74       | 0.41        |
|         | Med (μs)           | 6.45/6.51           | $\color{RedOrange}+0.84％$ | 0.71       | 0.35        |
|         | Min (μs)           | 5.93/5.96           | $\color{RedOrange}+0.42％$ | 3.21       | 1.52        |
|         | 90% (μs)           | 6.74/6.80           | $\color{RedOrange}+0.90％$ | 0.75       | 0.40        |
|         | 99% (μs)           | 7.08/7.14           | $\color{RedOrange}+0.90％$ | 1.06       | 0.56        |
|         | 99.9% (μs)         | 7.62/7.71           | $\color{RedOrange}+1.19％$ | 3.30       | 3.65        |
| select  | Request per second | 149243.05/147649.46 | $\color{green}-1.07％$     | 0.89       | 0.40        |
|         | Avg (μs)           | 6.70/6.77           | $\color{RedOrange}+1.08％$ | 0.78       | 0.40        |
|         | Med (μs)           | 6.65/6.72           | $\color{RedOrange}+1.06％$ | 0.65       | 0.34        |
|         | Min (μs)           | 6.12/6.14           | $\color{RedOrange}+0.37％$ | 2.79       | 1.10        |
|         | 90% (μs)           | 6.93/7.01           | $\color{RedOrange}+1.12％$ | 0.73       | 0.37        |
|         | 99% (μs)           | 7.27/7.35           | $\color{RedOrange}+1.10％$ | 1.04       | 0.50        |
|         | 99.9% (μs)         | 7.80/7.94           | $\color{RedOrange}+1.81％$ | 3.59       | 4.13        |
| replace | Request per second | 153753.18/152265.28 | $\color{green}-0.97％$     | 0.65       | 0.34        |
|         | Avg (μs)           | 6.50/6.57           | $\color{RedOrange}+0.98％$ | 0.75       | 0.34        |
|         | Med (μs)           | 6.45/6.51           | $\color{RedOrange}+0.93％$ | 0.72       | 0.31        |
|         | Min (μs)           | 5.93/5.96           | $\color{RedOrange}+0.44％$ | 3.92       | 1.43        |
|         | 90% (μs)           | 6.74/6.81           | $\color{RedOrange}+1.02％$ | 0.74       | 0.36        |
|         | 99% (μs)           | 7.08/7.15           | $\color{RedOrange}+1.00％$ | 0.98       | 0.53        |
|         | 99.9% (μs)         | 7.63/7.70           | $\color{RedOrange}+0.91％$ | 3.67       | 4.32        |
| delete  | Request per second | 150079.50/148964.96 | $\color{green}-0.74％$     | 2.77       | 0.60        |
|         | Avg (μs)           | 6.66/6.71           | $\color{RedOrange}+0.74％$ | 0.84       | 0.61        |
|         | Med (μs)           | 6.61/6.66           | $\color{RedOrange}+0.86％$ | 0.71       | 0.33        |
|         | Min (μs)           | 6.05/6.08           | $\color{RedOrange}+0.44％$ | 3.24       | 1.26        |
|         | 90% (μs)           | 6.89/6.95           | $\color{RedOrange}+0.91％$ | 0.77       | 0.38        |
|         | 99% (μs)           | 7.22/7.28           | $\color{RedOrange}+0.84％$ | 1.10       | 0.55        |
|         | 99.9% (μs)         | 7.83/7.81           | $\color{green}-0.20％$     | 3.61       | 5.88        |

## Batched (1000 requests)

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


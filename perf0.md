# Default VS logarithmic offset tree performance

Information about the tests:
- measured: [memtx tree benchmark](https://github.com/tarantool/tarantool/pull/10288);
- request count: 1M;
- key: `{unsigned}`;
- WAL: off;


## Current BPS tree

| test                    | 50%                                                 | disp           | stdev         | t-test                           |
| ----------------------- | --------------------------------------------------- | -------------- | ------------- | -------------------------------- |
| box_insert_incremental  | 1797312.50 / 1702454.00 ($\color{red}-5.28％$)       | 3.93% / 3.03%  | 1.40% / 1.14% | ~                                |
| box_replace_incremental | 1743313.00 / 1742519.50 ($\color{RedOrange}-0.05％$) | 1.79% / 3.80%  | 0.84% / 1.24% | ~                                |
| box_delete_incremental  | 1404025.00 / 1327499.00 ($\color{red}-5.45％$)       | 1.62% / 0.78%  | 0.74% / 0.31% | Regression (t-value 7.33 > 3.47) |
| box_get_incremental     | 8139586.50 / 8100374.50 ($\color{RedOrange}-0.48％$) | 0.85% / 17.30% | 0.36% / 5.92% | ~                                |
| box_insert_linear       | 1018492.00 / 955803.50 ($\color{red}-6.16％$)        | 1.22% / 1.11%  | 0.85% / 0.46% | Regression (t-value 7.32 > 3.41) |
| box_replace_linear      | 1041575.00 / 1031513.50 ($\color{RedOrange}-0.97％$) | 1.30% / 2.26%  | 1.00% / 1.07% | ~                                |
| box_delete_linear       | 790545.50 / 758852.00 ($\color{red}-4.01％$)         | 0.67% / 0.89%  | 0.63% / 0.43% | Regression (t-value 6.36 > 3.37) |
| box_get_linear          | 7899249.00 / 8326384.50 ($\color{green}+5.41％$)     | 0.18% / 16.76% | 0.07% / 5.70% | ~                                |


## After tarantool/tarantool#10183
### Generic solution

| test                    | 50%                                                 | disp          | stdev         | t-test                             |
| ----------------------- | --------------------------------------------------- | ------------- | ------------- | ---------------------------------- |
| box_insert_incremental  | 1797312.50 / 1764292.00 ($\color{RedOrange}-1.84％$) | 3.93% / 2.27% | 1.40% / 0.77% | ~                                  |
| box_replace_incremental | 1743313.00 / 1735899.00 ($\color{RedOrange}-0.43％$) | 1.79% / 3.04% | 0.84% / 0.96% | ~                                  |
| box_delete_incremental  | 1404025.00 / 1427792.00 ($\color{green}+1.69％$)     | 1.62% / 0.61% | 0.74% / 0.39% | ~                                  |
| box_get_incremental     | 8139586.50 / 8103228.00 ($\color{RedOrange}-0.45％$) | 0.85% / 1.17% | 0.36% / 0.42% | ~                                  |
| box_insert_linear       | 1018492.00 / 991367.50 ($\color{red}-2.66％$)        | 1.22% / 1.42% | 0.85% / 0.77% | ~                                  |
| box_replace_linear      | 1041575.00 / 1015313.00 ($\color{red}-2.52％$)       | 1.30% / 1.28% | 1.00% / 0.84% | ~                                  |
| box_delete_linear       | 790545.50 / 794302.00 ($\color{green}+0.48％$)       | 0.67% / 0.70% | 0.63% / 0.50% | ~                                  |
| box_get_linear          | 7899249.00 / 8251549.50 ($\color{green}+4.46％$)     | 0.18% / 0.63% | 0.07% / 0.26% | Improvement (t-value 17.79 > 3.53) |

### New tuple insertion optimization

| test                    | 50%                                                 | disp          | stdev         | t-test                             |
| ----------------------- | --------------------------------------------------- | ------------- | ------------- | ---------------------------------- |
| box_insert_incremental  | 1797312.50 / 1790005.50 ($\color{RedOrange}-0.41％$) | 3.93% / 1.36% | 1.40% / 0.82% | ~                                  |
| box_replace_incremental | 1743313.00 / 1741304.00 ($\color{RedOrange}-0.12％$) | 1.79% / 1.82% | 0.84% / 0.81% | ~                                  |
| box_delete_incremental  | 1404025.00 / 1425824.50 ($\color{green}+1.55％$)     | 1.62% / 0.81% | 0.74% / 0.38% | ~                                  |
| box_get_incremental     | 8139586.50 / 8097996.50 ($\color{RedOrange}-0.51％$) | 0.85% / 0.81% | 0.36% / 0.55% | ~                                  |
| box_insert_linear       | 1018492.00 / 1026361.50 ($\color{green}+0.77％$)     | 1.22% / 0.80% | 0.85% / 0.55% | ~                                  |
| box_replace_linear      | 1041575.00 / 1023277.50 ($\color{RedOrange}-1.76％$) | 1.30% / 1.75% | 1.00% / 1.13% | ~                                  |
| box_delete_linear       | 790545.50 / 796983.50 ($\color{green}+0.81％$)       | 0.67% / 1.02% | 0.63% / 0.59% | ~                                  |
| box_get_linear          | 7899249.00 / 8147340.00 ($\color{green}+3.14％$)     | 0.18% / 0.52% | 0.07% / 0.22% | Improvement (t-value 14.47 > 3.50) |


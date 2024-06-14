# Default VS logarithmic offset tree performance

Raw socket `write` + `read` of 1000 request batch latency. Requests use unique incremental keys (0, 1, 2, ...).

Options:
- WAL mode: none
- PK: unsigned
- Dataset: monotonically incremental (1)

**NOTE**: The difference in select qery is highly suspicious, the results are to be actualized.

| Benchmark | Base    | Log(n) Offset Tree               |
| --------- | ------- | -------------------------------- |
| insert    | 457krps | 448krps ($\color{red}-2.02％$)   |
| replace   | 451krps | 451krps ($\color{green}+0.05％$) |
| select    | 760krps | 737krps ($\color{red}-3.01％$)   |
| delete    | 424krps | 415krps ($\color{red}-2.00％$)   |

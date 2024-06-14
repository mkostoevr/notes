# Default VS logarithmic offset tree performance

Options:
- WAL off
- unsigned PK
- incremental unique key insertion/selection/replace/deletion

**NOTE**: The difference in select qery is highly suspicious, the results are to be actuslized.

| Benchmark | Base    | Log(n) Offset Tree               |
| --------- | ------- | -------------------------------- |
| insert    | 457krps | 448krps ($\color{red}-2.02％$)   |
| replace   | 451krps | 451krps ($\color{green}+0.05％$) |
| select    | 760krps | 737krps ($\color{red}-3.01％$)   |
| delete    | 424krps | 415krps ($\color{red}-2.00％$)   |

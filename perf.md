| Benchmark | Base    | Log(n) Offset Tree
| --------- | ------- | -------------------------------- | ------------------------------- |
| insert    | 457krps | 448krps ($\color{red}-2.02％$)   | 427krps ($\color{red}-6.59％$)   |
| replace   | 451krps | 451krps ($\color{green}+0.05％$) | 451krps ($\color{green}+0.16％$) |
| select    | 760krps | 737krps ($\color{red}-3.01％$)   | 736krps ($\color{red}-3.22％$)   |
| delete    | 424krps | 415krps ($\color{red}-2.00％$)   | 403krps ($\color{red}-4.99％$)   |
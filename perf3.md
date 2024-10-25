# Select 1M tuples, 10 tuples per EQ key

<table>
<tr>
  <th>Part</th>
  <th>Raw index (master)</th>
  <th>Read view in pthread (master)</th>
  <th>Read view in pthread (EQ/REQ optimization)</th>
  <th>Read view in pthread (Alexander's patch)</th>
</tr>
<tr>
  <td>1</td>
  <td>0.125</td>
  <td>0.067</td>
  <td>0.072 ($\color{red}+7.780%％$)</td>
  <td>0.060 ($\color{green}-9.769%％$)</td>
</tr>
<tr>
  <td>3000</td>
  <td>0.108</td>
  <td>14.008</td>
  <td>6.966 ($\color{green}-50.271%％$)</td>
  <td>0.064 ($\color{green}-99.543%％$)</td>
</tr>
</table>

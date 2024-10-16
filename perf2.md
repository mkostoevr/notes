## Part 1

<table>
<tr>
  <th>Tuple count</th>
  <th>Raw index (master)</th>
  <th>Read view (master)</th>
  <th>Read view (EQ/REQ optimization)</th>
  <th>Read view (Alexander's patch)</th>
</tr>
<tr>
  <td>1</td>
  <td>1.40</td>
  <td>3.88</td>
  <td>3.86 ($\color{green}-0.44%％$)</td>
  <td>3.46 ($\color{green}-10.77%％$)</td>
</tr>
<tr>
  <td>2</td>
  <td>1.03</td>
  <td>2.40</td>
  <td>2.52 ($\color{RedOrange}+4.87%％$)</td>
  <td>1.90 ($\color{green}-20.77%％$)</td>
</tr>
<tr>
  <td>5</td>
  <td>0.61</td>
  <td>1.52</td>
  <td>1.52 ($\color{RedOrange}+0.47%％$)</td>
  <td>1.05 ($\color{green}-30.65%％$)</td>
</tr>
<tr>
  <td>10</td>
  <td>0.45</td>
  <td>1.20</td>
  <td>1.20 ($\color{RedOrange}+0.16%％$)</td>
  <td>0.71 ($\color{green}-40.76%％$)</td>
</tr>
<tr>
  <td>20</td>
  <td>0.44</td>
  <td>1.07</td>
  <td>1.07 ($\color{RedOrange}+0.20%％$)</td>
  <td>0.56 ($\color{green}-47.47%％$)</td>
</tr>
<tr>
  <td>30</td>
  <td>0.55</td>
  <td>0.98</td>
  <td>0.98 ($\color{RedOrange}+0.28%％$)</td>
  <td>0.50 ($\color{green}-49.25%％$)</td>
</tr>
<tr>
  <td>40</td>
  <td>0.55</td>
  <td>0.94</td>
  <td>0.94 ($\color{green}-0.77%％$)</td>
  <td>0.51 ($\color{green}-45.85%％$)</td>
</tr>
<tr>
  <td>50</td>
  <td>0.48</td>
  <td>0.96</td>
  <td>0.96 ($\color{green}-0.48%％$)</td>
  <td>0.59 ($\color{green}-38.80%％$)</td>
</tr>
<tr>
  <td>75</td>
  <td>0.50</td>
  <td>0.96</td>
  <td>0.95 ($\color{green}-1.68%％$)</td>
  <td>0.60 ($\color{green}-37.98%％$)</td>
</tr>
<tr>
  <td>100</td>
  <td>0.47</td>
  <td>0.93</td>
  <td>0.95 ($\color{RedOrange}+1.78%％$)</td>
  <td>0.52 ($\color{green}-43.70%％$)</td>
</tr>
<tr>
  <td>150</td>
  <td>0.42</td>
  <td>0.89</td>
  <td>1.01 ($\color{red}+12.97%％$)</td>
  <td>0.50 ($\color{green}-44.13%％$)</td>
</tr>
<tr>
  <td>200</td>
  <td>0.43</td>
  <td>0.85</td>
  <td>0.86 ($\color{RedOrange}+1.02%％$)</td>
  <td>0.49 ($\color{green}-42.14%％$)</td>
</tr>
<tr>
  <td>250</td>
  <td>0.42</td>
  <td>0.80</td>
  <td>0.79 ($\color{green}-0.18%％$)</td>
  <td>0.44 ($\color{green}-44.64%％$)</td>
</tr>
<tr>
  <td>300</td>
  <td>0.43</td>
  <td>0.80</td>
  <td>0.80 ($\color{RedOrange}+0.08%％$)</td>
  <td>0.46 ($\color{green}-42.66%％$)</td>
</tr>
<tr>
  <td>400</td>
  <td>0.43</td>
  <td>0.81</td>
  <td>0.79 ($\color{green}-3.37%％$)</td>
  <td>0.44 ($\color{green}-45.47%％$)</td>
</tr>
<tr>
  <td>500</td>
  <td>0.42</td>
  <td>0.79</td>
  <td>0.79 ($\color{green}-0.81%％$)</td>
  <td>0.44 ($\color{green}-45.13%％$)</td>
</tr>
</table>


## Part 3000

<table>
<tr>
  <th>Tuple count</th>
  <th>Raw index (master)</th>
  <th>Read view (master)</th>
  <th>Read view (EQ/REQ optimization)</th>
  <th>Read view (Alexander's patch)</th>
</tr>
<tr>
  <td>1</td>
  <td>1.24</td>
  <td>181.89</td>
  <td>181.21 ($\color{green}-0.37%％$)</td>
  <td>12.61 ($\color{green}-93.07%％$)</td>
</tr>
<tr>
  <td>2</td>
  <td>0.94</td>
  <td>100.03</td>
  <td>162.70 ($\color{red}+62.65%％$)</td>
  <td>11.14 ($\color{green}-88.87%％$)</td>
</tr>
<tr>
  <td>5</td>
  <td>0.61</td>
  <td>49.62</td>
  <td>70.29 ($\color{red}+41.67%％$)</td>
  <td>10.24 ($\color{green}-79.36%％$)</td>
</tr>
<tr>
  <td>10</td>
  <td>0.46</td>
  <td>33.14</td>
  <td>39.97 ($\color{red}+20.62%％$)</td>
  <td>9.87 ($\color{green}-70.22%％$)</td>
</tr>
<tr>
  <td>20</td>
  <td>0.41</td>
  <td>24.90</td>
  <td>25.05 ($\color{RedOrange}+0.57%％$)</td>
  <td>9.79 ($\color{green}-60.70%％$)</td>
</tr>
<tr>
  <td>30</td>
  <td>0.53</td>
  <td>22.11</td>
  <td>19.70 ($\color{green}-10.90%％$)</td>
  <td>9.70 ($\color{green}-56.15%％$)</td>
</tr>
<tr>
  <td>40</td>
  <td>0.51</td>
  <td>20.73</td>
  <td>17.11 ($\color{green}-17.48%％$)</td>
  <td>9.63 ($\color{green}-53.54%％$)</td>
</tr>
<tr>
  <td>50</td>
  <td>0.48</td>
  <td>20.07</td>
  <td>15.95 ($\color{green}-20.53%％$)</td>
  <td>9.60 ($\color{green}-52.18%％$)</td>
</tr>
<tr>
  <td>75</td>
  <td>0.45</td>
  <td>19.06</td>
  <td>13.71 ($\color{green}-28.06%％$)</td>
  <td>9.60 ($\color{green}-49.61%％$)</td>
</tr>
<tr>
  <td>100</td>
  <td>0.42</td>
  <td>18.51</td>
  <td>12.70 ($\color{green}-31.40%％$)</td>
  <td>9.53 ($\color{green}-48.53%％$)</td>
</tr>
<tr>
  <td>150</td>
  <td>0.40</td>
  <td>17.76</td>
  <td>11.42 ($\color{green}-35.67%％$)</td>
  <td>9.39 ($\color{green}-47.12%％$)</td>
</tr>
<tr>
  <td>200</td>
  <td>0.42</td>
  <td>17.64</td>
  <td>10.79 ($\color{green}-38.85%％$)</td>
  <td>9.28 ($\color{green}-47.41%％$)</td>
</tr>
<tr>
  <td>250</td>
  <td>0.39</td>
  <td>17.59</td>
  <td>10.38 ($\color{green}-40.99%％$)</td>
  <td>9.24 ($\color{green}-47.48%％$)</td>
</tr>
<tr>
  <td>300</td>
  <td>0.37</td>
  <td>17.33</td>
  <td>10.22 ($\color{green}-41.04%％$)</td>
  <td>9.22 ($\color{green}-46.78%％$)</td>
</tr>
<tr>
  <td>400</td>
  <td>0.37</td>
  <td>17.08</td>
  <td>10.01 ($\color{green}-41.35%％$)</td>
  <td>9.23 ($\color{green}-45.94%％$)</td>
</tr>
<tr>
  <td>500</td>
  <td>0.37</td>
  <td>16.94</td>
  <td>9.83 ($\color{green}-41.97%％$)</td>
  <td>9.22 ($\color{green}-45.54%％$)</td>
</tr>
</table>

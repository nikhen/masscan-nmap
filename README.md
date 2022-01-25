# masscan vs. nmap
Compares the performance of masscan and nmap port scanners as a function
of the number of hosts.

To execute run

    bash main.sh

This will produce a *csv* file comparing the performance of nmap and
masscan, for example:

```
Targets, Difference (s), Nmap (s), Masscan (s)
5, 9927.45, 13248.60, 3321.15
10, 45938.78, 52570.37, 6631.59
20, 45863.14, 59115.67, 13252.53
50, 140052.51, 173167.70, 33115.19

```

The target list is made up of random IP addresses generated at runtime.
Fluctuations in scan results are expected.


For comparable scanning techniques, masscan outperforms nmap even for
small number of hosts.

# Results, exercise 6, Magne Sirnes

Results obtained with:
 + zeta  = 1
 + omega = 9
 + K_i = 30

Could probably have tuned Ki even harder, but that led to some adverse effects with dynamic load.

![PD controller results, no saturation](./PD_no_sat.png)
![PID controller results, no saturation](./PID_no_sat.png)

Effect of saturation visible in initial transient from theta(t=0) = 0, otherwise control signal is well within bounds.

![PD controller results, with saturation](./PD_sat.png)
![PID controller results, with saturation](./PID_sat.png)
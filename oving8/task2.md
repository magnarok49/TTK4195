# Task 2, plots of results:

As expected, the more elaborate inverse dynamics controller has much better performance, this owing to the fact that is uses a perfect model assumption, as well as perfect measurements to cancel nonlinear dynamics..   
  
Response using PD control for each state, with gravity compensation, assumes rdot = 0.

![Sinusoid response, PD controller with gravity compensation](./task2_PD_with_grav.png)
![Sinusoid response inputs, PD controller with gravity compensation](./task2_PD_with_grav_input.png)

Response using inverse dynamics control, using analytical expressions for entire reference vector. 

![Sinusoid response, inverse dynamics control](./task2_inv_dynamics.png)
![Sinusoid response inputs, inverse dynamics control](./task2_inv_dynamics_input.png)

All tuning params can be found in appended MATLAB script.


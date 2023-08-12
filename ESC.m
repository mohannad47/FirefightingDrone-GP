U_max= 
n_r = 
I_other = 1
%ESC I_emax , R_e , G_e
I_emax =
R_e =
G_e =

I_in = n_r * I_e + I_other

throttle = ((U_m)+(I_m*R_e))/(U_max)
I_e = throttle*I_m

I_in = n_r * I_e + I_other

U_e = U_max - I_in * R_in


% propulsion system model
%propeller: (D_p , H_p , B_p , G_p)
%motor (K_V0 , I_mmax, I_m0, U_m0 , R_m , Gm)
%ESC I_emax , R_e , G_e
P_a = 101325
Temp = 60
rho = (273*P_a)/(101325*(273+ Temp))*1.293 
%prop
D_p = 10    * 2.54*10^(-2)  %inch to meter
H_p = 4.5   * 2.54*10^(-2)    %inch to meter
B_p = 2
G_p = 120

N =5000
A = 5 ; eps = 0.85; lambda = 0.75 ; zeta = 0.5 ; e = 0.83;C_fd = 0.015 , alpha_0 = 0 , K_0 = 6.11  
C_d = C_fd + ((3.1415*A*K_0^2)*((eps * atan(H_p / (pi * D_p))-alpha_0)^2)/(e*(3.1415*A+K_0)^2))

C_T = 0.25 * (3.1415^3)*lambda*(zeta^2)*B_p*K_0*(eps * atan(H_p/(3.1415*D_p)-alpha_0)/(3.1415*A+K_0))
C_M = (1/(8*A)) * (3.1415^2) * C_d  * lambda*zeta^2*B_p^2

T = C_T .* rho .*((N./60).^2) .* D_p ^4
M = C_M .* rho .*((N./60).^2) .* D_p ^5

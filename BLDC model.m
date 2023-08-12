% propulsion system model
%propeller: (D_p , H_p , B_p , G_p)
%motor (K_V0 , I_mmax, I_m0, U_m0 , R_m , Gm)
%ESC I_emax , R_e , G_e
G = 6;
n_r = 4;
P_a = 101325;
Tem = 40;
rho = (273*P_a)/(101325*(273+ Tem))*1.293 ;
%prop
D_p = 20    * 2.54*10^(-2);
H_p = 8   * 2.54*10^(-2);
B_p = 2;
G_p = 120;


A = 5 ; eps = 0.85; lambda = 0.75 ; zeta = 0.5 ; e = 0.83;C_fd = 0.015 ; alpha_0 = 0 ; K_0 = 6.11 ; 
C_d = C_fd + ((3.1415*A*K_0^2)*((eps * atan(H_p / (pi * D_p))-alpha_0)^2)/(e*(3.1415*A+K_0)^2));

C_T = 0.25 * (3.1415^3)*lambda*(zeta^2)*B_p*K_0*(eps * atan(H_p/(3.1415*D_p)-alpha_0)/(3.1415*A+K_0));
C_M = (1/(8*A)) * (3.1415^2) * C_d  * lambda*zeta^2*B_p^2;

syms N
T = G/n_r;
Nmat = solve((T == C_T * rho *((N/60)^2)* D_p ^4),N);
N = double(abs(Nmat(1)))
M = C_M* rho*((N/60)^2)* D_p ^5


%motor (K_V0 , I_mmax, I_m0, U_m0 , R_m , Gm)

K_V0= 340;
I_mmax= 200;
I_m0= 6.2;
U_m0= 20;
R_m=0.006;
Gm=1700;

U_m = (((M*K_V0*U_m0)/((9.55)*(U_m0-I_m0*R_m)))+(I_m0))*R_m+((((U_m0)-(I_m0*R_m))/(K_V0*U_m0))*(N))
I_m = (((M*K_V0*U_m0)/((9.55)*(U_m0-I_m0*R_m)))+(I_m0))


U_max= 20;
R_in = 0.01;
I_other = 2;
%ESC I_emax , R_e , G_e
I_emax =55;
R_e =0.008;
G_e =100;

throttle = ((U_m)+(I_m*R_e))/(U_max)
I_e = throttle*I_m
I_in = n_r * I_e + I_other;
U_e = U_max - I_in * R_in
U_eo = throttle * U_max

P_elec_req =I_in * U_max 

%parameters overall
m_C = 1.604; %chassis and battery
A = 115.5e-4; %cross-sectional area
c_D = 0.81; %drag coefficient
R_A = 0.36; %armature resistance
L_A = 0.11e-3; %armature inductance
k_M = -42.43e-3; %machine constant
J_EM = 164e-7; %mass inertia EM
iG=1; %gear ratio
J_BG = 1.057e-6; %mass inertia of bevel
J_DS = 2.333e-7;
r_DG = 21.03e-3;
J_DG = 6.132e-6; %mass inertia drive gear
r_W = 25e-3; %radius wheel
m_W_Te = 29.8e-3;
m_W_St = 138.25e-3;
J_W_Te = 1.016e-5; %mass inertia teflon
J_W_St = 4.094e-5; %mass inertia steel
rho_A = 1.2; %air density
alpha = deg2rad(15); %track slope
mu_R_Te = 0.05;
mu_R_St = 0.07;
g = 9.81;


%calculation of rotational mass factor (k) for teflon and steel repectively
m_trans_Te = m_C + 4*m_W_Te;
m_trans_St = m_C + 4*m_W_St;
m_eq_drivetrain = (J_EM+2*J_BG+J_DS+J_DG)/(r_DG*r_DG);
m_eq_wheels_Te = 4*J_W_Te/(r_W*r_W);
m_eq_wheels_St = 4*J_W_St/(r_W*r_W);
k_Te = (m_trans_Te+m_eq_drivetrain+m_eq_wheels_Te)/m_trans_Te;
k_St = (m_trans_St+m_eq_drivetrain+m_eq_wheels_St)/m_trans_St;



%1-D lookup table
LT1D_R_LH =[10 20 30 40;
            0.618 0.276 0.204 0.146];



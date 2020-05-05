
function J=robot_formular(Theta_input,Delta_a,Delta_d,Alpha_G)

Th_1=Theta_input(1)*pi/180;
Th_2=Theta_input(2)*pi/180;
Th_3=Theta_input(3)*pi/180;
Th_4=Theta_input(4)*pi/180;
Th_5=Theta_input(5)*pi/180;
Th_6=Theta_input(6)*pi/180;

Delta_a1=Delta_a(1);
Delta_a2=Delta_a(2);
Delta_a3=Delta_a(3);
Delta_a4=Delta_a(4);
Delta_a5=Delta_a(5);
Delta_a6=Delta_a(6);

Delta_d1=Delta_d(1);
Delta_d2=Delta_d(2);
Delta_d3=Delta_d(3);
Delta_d4=Delta_d(4);
Delta_d5=Delta_d(5);
Delta_d6=Delta_d(6);

Alpha_1=Alpha_G(1);
Alpha_2=Alpha_G(2);
Alpha_3=Alpha_G(3);
Alpha_4=Alpha_G(4);
Alpha_5=Alpha_G(5);
Alpha_6=Alpha_G(6);

A_01=[cos(Th_1) 0 -sin(Th_1) Delta_d1*cos(Th_1);
      sin(Th_1) 0  cos(Th_1) Delta_d1*sin(Th_1);
      0         -1  0        Delta_a1;
      0         0   0        1];
A_12=[cos(Th_2)  -sin(Th_2) 0 Delta_d2*cos(Th_2);
      sin(Th_2)   cos(Th_2) 0 Delta_d2*sin(Th_2);
      0           0         1 Delta_a2;
      0           0         0 1];
A_23=[cos(Th_3) 0 -sin(Th_3) Delta_d3*cos(Th_3);
      sin(Th_3) 0  cos(Th_3) Delta_d3*sin(Th_3);
      0         -1  0        Delta_a3;
      0         0   0        1];
A_34=[cos(Th_4)  -sin(Th_4) 0 Delta_d4*cos(Th_4);
      sin(Th_4)   cos(Th_4) 0 Delta_d4*sin(Th_4);
      0           0         1 Delta_a4;
      0           0         0 1];
A_45=[cos(Th_5) 0 -sin(Th_5) Delta_d5*cos(Th_5);
      sin(Th_5) 0  cos(Th_5) Delta_d5*sin(Th_5);
      0         -1  0        Delta_a5;
      0         0   0        1];
A_56=[cos(Th_6)  -sin(Th_6) 0 Delta_d6*cos(Th_6);
      sin(Th_6)   cos(Th_6) 0 Delta_d6*sin(Th_6);
      0           0         1 Delta_a6;
      0           0         0 1];
  
A_06=A_01*A_12*A_23*A_34*A_45*A_56;
A_16=A_12*A_23*A_34*A_45*A_56;
A_26=A_23*A_34*A_45*A_56;
A_36=A_34*A_45*A_56;
A_46=A_45*A_56;

n_06=A_06(1:3,1);o_06=A_06(1:3,2);a_06=A_06(1:3,3);p_06=A_06(1:3,4);
n_16=A_16(1:3,1);o_16=A_16(1:3,2);a_16=A_16(1:3,3);p_16=A_16(1:3,4);
n_26=A_26(1:3,1);o_26=A_26(1:3,2);a_26=A_26(1:3,3);p_26=A_26(1:3,4);
n_36=A_36(1:3,1);o_36=A_36(1:3,2);a_36=A_36(1:3,3);p_36=A_36(1:3,4);
n_46=A_46(1:3,1);o_46=A_46(1:3,2);a_46=A_46(1:3,3);p_46=A_46(1:3,4);
n_56=A_56(1:3,1);o_56=A_56(1:3,2);a_56=A_56(1:3,3);p_56=A_56(1:3,4);

pn06=cross(p_06,n_06);po06=cross(p_06,o_06);pa06=cross(p_06,a_06);
pn16=cross(p_16,n_16);po16=cross(p_16,o_16);pa16=cross(p_16,a_16);
pn26=cross(p_26,n_26);po26=cross(p_26,o_26);pa26=cross(p_26,a_26);
pn36=cross(p_36,n_36);po36=cross(p_36,o_36);pa36=cross(p_36,a_36);
pn46=cross(p_46,n_46);po46=cross(p_46,o_46);pa46=cross(p_46,a_46);
pn56=cross(p_56,n_56);po56=cross(p_56,o_56);pa56=cross(p_56,a_56);


J_06=[n_06(1) n_06(2) n_06(3) pn06(1) pn06(2) pn06(3);
      o_06(1) o_06(2) o_06(3) po06(1) po06(2) po06(3);
      a_06(1) a_06(2) a_06(3) pa06(1) pa06(2) pa06(3);
      0       0       0       n_06(1) n_06(2) n_06(3);
      0       0       0       o_06(1) o_06(2) o_06(3);
      0       0       0       a_06(1) a_06(2) a_06(3);];
J_16=[n_16(1) n_16(2) n_16(3) pn16(1) pn16(2) pn16(3);
      o_16(1) o_16(2) o_16(3) po16(1) po16(2) po16(3);
      a_16(1) a_16(2) a_16(3) pa16(1) pa16(2) pa16(3);
      0       0       0       n_16(1) n_16(2) n_16(3);
      0       0       0       o_16(1) o_16(2) o_16(3);
      0       0       0       a_16(1) a_16(2) a_16(3);];
J_26=[n_26(1) n_26(2) n_26(3) pn26(1) pn26(2) pn26(3);
      o_26(1) o_26(2) o_26(3) po26(1) po26(2) po26(3);
      a_26(1) a_26(2) a_26(3) pa26(1) pa26(2) pa26(3);
      0       0       0       n_26(1) n_26(2) n_26(3);
      0       0       0       o_26(1) o_26(2) o_26(3);
      0       0       0       a_26(1) a_26(2) a_26(3);];
J_36=[n_36(1) n_36(2) n_36(3) pn36(1) pn36(2) pn36(3);
      o_36(1) o_36(2) o_36(3) po36(1) po36(2) po36(3);
      a_36(1) a_36(2) a_36(3) pa36(1) pa36(2) pa36(3);
      0       0       0       n_36(1) n_36(2) n_36(3);
      0       0       0       o_36(1) o_36(2) o_36(3);
      0       0       0       a_36(1) a_36(2) a_36(3);];
J_46=[n_46(1) n_46(2) n_46(3) pn46(1) pn46(2) pn46(3);
      o_46(1) o_46(2) o_46(3) po46(1) po46(2) po46(3);
      a_46(1) a_46(2) a_46(3) pa46(1) pa46(2) pa46(3);
      0       0       0       n_46(1) n_46(2) n_46(3);
      0       0       0       o_46(1) o_46(2) o_46(3);
      0       0       0       a_46(1) a_46(2) a_46(3);];
J_56=[n_56(1) n_56(2) n_56(3) pn56(1) pn56(2) pn56(3);
      o_56(1) o_56(2) o_56(3) po56(1) po56(2) po56(3);
      a_56(1) a_56(2) a_56(3) pa56(1) pa56(2) pa56(3);
      0       0       0       n_56(1) n_56(2) n_56(3);
      0       0       0       o_56(1) o_56(2) o_56(3);
      0       0       0       a_56(1) a_56(2) a_56(3);];


G1=[1 0 0 0;
    0  Delta_d1*cos(Delta_a1)  sin(Delta_a1) 0 ;
    0 -Delta_d1*sin(Delta_a1)  cos(Delta_a1) 0 ;
    0 0 0 1;
    0 sin(Delta_a1) 0 0;
    0 cos(Delta_a1) 0 0];
G2=[1 0 0 0;
    0  Delta_d2*cos(Delta_a2)  sin(Delta_a2) 0 ;
    0 -Delta_d2*sin(Delta_a2)  cos(Delta_a2) 0 ;
    0 0 0 1;
    0 sin(Delta_a2) 0 0;
    0 cos(Delta_a2) 0 0];
G3=[1 0 0 0;
    0  Delta_d3*cos(Delta_a3)  sin(Delta_a3) 0 ;
    0 -Delta_d3*sin(Delta_a3)  cos(Delta_a3) 0 ;
    0 0 0 1;
    0 sin(Delta_a3) 0 0;
    0 cos(Delta_a3) 0 0];
G4=[1 0 0 0;
    0  Delta_d4*cos(Delta_a4)  sin(Delta_a4) 0 ;
    0 -Delta_d4*sin(Delta_a4)  cos(Delta_a4) 0 ;
    0 0 0 1;
    0 sin(Delta_a4) 0 0;
    0 cos(Delta_a4) 0 0];
G5=[1 0 0 0;
    0  Delta_d5*cos(Delta_a5)  sin(Delta_a5) 0 ;
    0 -Delta_d5*sin(Delta_a5)  cos(Delta_a5) 0 ;
    0 0 0 1;
    0 sin(Delta_a5) 0 0;
    0 cos(Delta_a5) 0 0];
G6=[1 0 0 0;
    0  Delta_d6*cos(Delta_a6)  sin(Delta_a6) 0 ;
    0 -Delta_d6*sin(Delta_a6)  cos(Delta_a6) 0 ;
    0 0 0 1;
    0 sin(Delta_a6) 0 0;
    0 cos(Delta_a6) 0 0];

% X1=[eroorDelta_d1; errorTh_1; errorDelta_a1 ;error_alpha1];
% X2=[eroorDelta_d2; errorTh_2; errorDelta_a2 ;error_alpha2];
% X3=[eroorDelta_d3; errorTh_3; errorDelta_a3 ;error_alpha3];
% X4=[eroorDelta_d4; errorTh_4; errorDelta_a4 ;error_alpha4];
% X5=[eroorDelta_d5; errorTh_5; errorDelta_a5 ;error_alpha5];
% X6=[eroorDelta_d6; errorTh_6; errorDelta_a6 ;error_alpha6];

J=[J_16*G1 J_26*G2 J_36*G3 J_46*G4 J_56*G5 G6];
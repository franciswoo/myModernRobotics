clear;
clc

q = zeros(6,1);
W1 = 0.109; W2 = 0.082; L1 = 0.425; L2 = 0.392; H1 = 0.089; H2 = 0.095;
M = [-1 0 0 L1+L2;
      0 0 1 W1+W2;
      0 1 0 H1-H2;
      0 0 0     1];
w1 = [0 0 1]; q1 = [0 0 0]; v1 = -cross(w1,q1); S1 = [w1 v1];
w2 = [0 1 0]; q2 = [0 0 H1]; v2 = -cross(w2,q2); S2 = [w2 v2];
w3 = [0 1 0]; q3 = [L1 0 H1]; v3 = -cross(w3,q3); S3 = [w3 v3];
w4 = [0 1 0]; q4 = [L1+L2 0 H1]; v4 = -cross(w4,q4); S4 = [w4 v4];
w5 = [0 0 -1]; q5 = [L1+L2 W1 H1]; v5 = -cross(w5,q5); S5 = [w5 v5];
w6 = [0 1 0]; q6 = [L1+L2 0 H1-H2]; v6 = -cross(w6,q6); S6 = [w6 v6];
S = [S1' S2' S3' S4' S5' S6'];

thetaList = [0 -pi/2 0 0 pi/2 0];
T1 = poE(S1,thetaList(1)); T2 = poE(S2,thetaList(2)); T3 = poE(S3,thetaList(3));
T4 = poE(S4,thetaList(4)); T5 = poE(S5,thetaList(5)); T6 = poE(S6,thetaList(6));
T =T1 * T2 * T3 * T4 * T5 * T6 * M;
TS = [T1 T2 T3 T4 T5 T6];
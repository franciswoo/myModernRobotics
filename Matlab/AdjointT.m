function m = AdjointT(T)
% return the adjoint representation of R and p
% T homogeneous matrix
% R - Rotation Matrix(Using RotAxis funtion)
% p - translation vector
R = T(1:3,1:3);
p = T(1:3,4);
 m = [R zeros(3);
     vector2Skew(p)*R R];
end
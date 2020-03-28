function m = AdjointT(R, p)
% return the adjoint representation of R and p
% R - Rotation Matrix(Using RotAxis funtion)
% p - translation vector
 m = [R zeros(3);
     vector2SkewMatrix(p)*R R];
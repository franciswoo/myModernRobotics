function T = vector2SE3(V)
% This function transfer 6 dimension vector to se3
% V - velocity vector

T = [vector2Skew(V(1:3)) V(4:6); 0 0 0 0];

end
function m = RotAxis(w, theta)
%Rodrigues's formula
%Rot(w,theta) = e^([w]*theta)
    skew = vector2SkewMatrix(w);
    m = eye(3) + sin(theta)*skew + (1-cos(theta))*skew^2;
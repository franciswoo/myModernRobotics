function T = poE(s, q)
% s - screw axis
% q - angle or translation
    w = s(1:3).';
    v = s(4:6).';
    G = (eye(3)*q + (1 - cos(q))*vector2Skew(w) + ((q - sin(q))*(vector2Skew(w)^2)))*v;
    if norm(w) == 1 % w == 1
        T = [RotAxis(w,q) G;
             0  0  0     1];
    elseif norm(v) == 1 % v == 1
        T = [eye(3) v*q;
             0 0 0   1];
    else
        error('w is not a unit vector either than v')
    end
    

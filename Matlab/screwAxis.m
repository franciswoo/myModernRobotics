function s = screwAxis(w, v)
% w - angle velocity
% v - linear velocity
    V = [w v].';
    if w ~= 0
        s = V/norm(w);
    end
    if w == 0
        s = V/norm(v);
    end
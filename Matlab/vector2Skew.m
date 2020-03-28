function m = vector2Skew(v)
%This functino transfer vector to a
%skew-symmeric matrix
    m = [  0    -v(3)  v(2);
         v(3)      0  -v(1);
         -v(2)   v(1)    0];
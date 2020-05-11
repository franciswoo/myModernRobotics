function v = ad(V)
% ad function return the 6x6 matrix of V
% V - six vector spatial velocity
m1 = vector2Skew(V(1:3));
m2 = vector2Skew(V(4:6));

v = [m1 zeros(3,3);
     m2 m1];
end
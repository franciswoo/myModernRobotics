function vec = so3ToVec(so)
% ?
% so3 matrix
    vec = [so(3,2); so(1,3); so(2,1)];
end
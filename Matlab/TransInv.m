function inv = TransInv(T)
% TransInv function transfer matrix to 
% T - homogeneous matrix
R = T(1:3,1:3);
p = T(1:3,4);
inv = [R', -R' * p; 0 0 0 1];
end


function T = MatrixExp6(se3)
% ?
% se3 - homogeneous matrix

omgtheta = so3ToVec(se3(1: 3, 1: 3));
if NearZero(norm(omgtheta))
    T = [eye(3), se3(1: 3, 4); 0, 0, 0, 1];
else
    [omghat, theta] = AxisAng3(omgtheta);
    omgmat = se3(1: 3, 1: 3) / theta; 
    T = [MatrixExp3(se3(1: 3, 1: 3)),(eye(3) * theta + (1 - cos(theta)) * omgmat ...
          + (theta - sin(theta)) * omgmat * omgmat) ...
            * se3(1: 3, 4) / theta;
         0, 0, 0, 1];
end
end
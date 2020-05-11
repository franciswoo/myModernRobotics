function [omghat, theta] = AxisAng3(expc3)
% ?
% from 3D exponential coordinate omgahat*theta extract omghat and theta
% expc3 - 3d exponential vector

theta = norm(expc3);
omghat = expc3 / theta;
end
function torque = inverseDynamics(q, qd, qdd, g, Mlist, Glist, Slist, ftip)
% q - joint position
% qd - joint velocity
% qdd - joint acceleration
% g - Gravity vector
% Mlist - List of link frames {i} relative to {i-1} at the home position
% Glist - Spatial inertia matrices Gi of the links
% Slist - screw axis of joints in a space frame
% ftip - external wrench of end effector

n = size(q, 1);

Mi = eye(4); % init Mi matrix as 4x4 identity matrix
Ai = zeros(6, n);
AdTi = zeros(6, 6, n+1);
Vi = zeros(6, n+1);
Vdi = zeros(6, n+1);
Vdi(4:6,1) = -g;
AdTi(:,:,n+1) = AdjointT(TransInv(Mlist(:,:,n+1)));
Fi = ftip;
torque = zeros(n,1);
for i=1:n % forward
    Mi = Mi * Mlist(:,:,i);
    Ai(:,i) = AdjointT(TransInv(Mi)) * Slist(:,i);
    AdTi(:,:,i) = AdjointT(MatrixExp6(vector2SE3(Ai(:,i)*-q(i))) * TransInv(Mlist(:,:,i)));
    Vi(:,i+1) = AdTi(:,:,i) * Vi(:,i) + Ai(:,i) * qd(i);
    Vdi(:,i+1) = AdTi(:,:,i) * Vdi(:,i) + ad(Vi(:,i+1)) * Ai(:,i) * qd(i) + Ai(:,i) * qdd(i);
end

for i=n:-1:1 % backward
    Fi = AdTi(:,:,i+1)'*Fi + Glist(:,:,i)*Vdi(:,i+1) - ad(Vi(:,i+1))'*(Glist(:,:,i)*Vi(:,i+1));
    torque(i) = Fi' * Ai(:,i);
end

end
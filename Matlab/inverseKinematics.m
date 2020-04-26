function torque = inverseKinematics(q, qd, qdd, m, Mlist, glist, ftip)
% q - joint position
% qd - joint velocity
% qdd - joint acceleration
% Mlist - ineria matrix of link
% glist - Gravity vector
% ftip - external wrench of end effector
%     massMatrix1(massMatrix1==1)=robot.Bodies{1,1}.Inertia;
Gb = [Mlist zeros(3);
      zeros(3) m*eye(3)];

    torque = Gb;

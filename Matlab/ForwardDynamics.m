function qdd = ForwardDynamics(q, qd, qdd, Mlist, glist, ftip)
% q - joint position
% qd - joint velocity
% Mlist - ineria matrix of links
% glist - Gravity vector
% ftip - external wrench of end effector
%     massMatrix1(massMatrix1==1)=robot.Bodies{1,1}.Inertia;
    
    qdd = q;
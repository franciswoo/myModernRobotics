function J = jacobianS(T, S)
% This function represent the Space Jacobian
% T - T should content Rotation(R) and translation(p) information
% S - S content w and v
    [~, colT] = size(T);
    [~, colS] = size(S);
    jointNum = colT/4;
    if(jointNum ~= colS)
        error('Joint Number are not complitable');
    end
    jt = zeros(6,jointNum);%jacobian temp
    j = 1:jointNum;
    for i=1:4:colT
        R = T(1:3,i:i+2);
        p = T(1:3,i+3);
        jt(1:6,j) = AdjointT(R,p) * S(1:6,j);
    end
    
	J = jt;
function m = Spinor(w,v)
%Motion Spinor as Lie Form
    m = [vector2SkewMatrix(w) v';
         0  0   0   0];
     
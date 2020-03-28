function m = Spinor(w,v)
%Motion Spinor as Lie Form
    m = [vector2Skew(w) v';
         0  0   0   0];
     
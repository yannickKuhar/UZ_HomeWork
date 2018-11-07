function Ig = simple_median(I, W)
    idx = ceil(W / 2);
    w = ceil(W / 2) - 1;
    
    Ig = I;
    
    win = zeros(W, 1);
    
    for i = idx:(length(Ig) - w)
        
        win(idx) = Ig(i);
        
        for j=1:w
            win(idx + j) = Ig(i + j);
            win(idx - j) = Ig(i - j);
        end
        
        Ig(i) = median(win);
    end
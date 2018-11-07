function Ig = simple_median2D(I, W)
    
    idx = ceil(W / 2);
    raz = ceil(W / 2) - 1;

    win = zeros(W);
    Ig = I;
    
    [w, h] = size(Ig);
    
    for i = idx:(w - raz)
        for j = idx:(h - raz)
            
            win(idx, idx) = Ig(idx, idx);
            
            %{ 
            Narobe.
            for k=(-raz:raz)
                for l=(-raz:raz)
                    win(idx + k, idx + l) = Ig(idx + k, idx + l);
                end
            end
            %}
            
            win = Ig(i-raz:i+raz , j-raz:j+raz);
            
            vec = win(:);
            mi = median(vec);
            
            Ig(i, j) = mi;
        end
    end
    
    
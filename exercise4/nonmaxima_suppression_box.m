function Imax = nonmaxima_suppression_box(I, t)
    x = I;
    [h, w] = size(I);
    y = zeros(h, w);
    
    global_max = max(I(:));
    global_min = min(I(:));

    [h, w] = size(I);
    
    for i = 2:(h - 1)
        for j = 2:(w - 1)
            
            cut = x(i-1:i+1, j-1:j+1);
            max_of_cut = max(cut(:));
            
            if(x(i, j) ~= max_of_cut)
                y(i, j) = 0;
            else
                tmp = ((max_of_cut - global_min) / (global_max - global_min)) * 255;
                if(tmp > t)
                    y(i, j) = tmp;
                else
                    y(i, j) = 0;
                end
            end
            
        end
    end
    
    % figure(1); clf; imagesc(y);
    
    Imax = y;

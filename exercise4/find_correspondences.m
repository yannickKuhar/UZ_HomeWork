function [indices, distances] = find_correspondences(D1, D2)
  
    [h1, w1] = size(D1);
    [h2, w2] = size(D2);
    
    indices = ones(1, h1);
    distances = ones(1, h1);
    
    for i = 1:h1
        
        d_tmp = 1000000000000000;
        j_tmp = -1;
        
        for j = 1:h2
            
            d = compare_histograms(D1(i,:), D2(j,:), 'hellinger');
            
            if(d < d_tmp)
                d_tmp = d;
                j_tmp = j;
            end
        end
        
        indices(i) = j_tmp;
        distances(i) = d_tmp;
    end
    
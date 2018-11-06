function[vals, idxs] = mymink(vector, k)
    
    vals = ones(k, 1);
    idxs = zeros(k, 1);

    for i = 1:k
        
        tmpv = 2.0;
        ix = 0;
        
        for j = 1:length(vector)
            
            if vector(j) < tmpv
                tmpv = vector(j);
                ix = j;
            end
            
        end
        
        vals(k) = tmpv;
        idxs(k) = ix;
        vector(ix) = 5.0
    end
    
    
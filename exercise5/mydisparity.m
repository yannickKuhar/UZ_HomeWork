function mydisparity(f, T)
    
    d = [];
    
    for i = 1:100
        d = [d, ((T * f/10) / i)];
    end
    
    figure(1); clf; plot(d);
    
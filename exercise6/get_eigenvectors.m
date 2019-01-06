function [mi, Ub] = get_eigenvectors(D)
    
    D = double(D);

    [h, w] = size(D);

    % (1.) Make x
    X = D;

    % (2.) calculate mi
    mi = mean(X');

    % (3.) Center data
    Xd = X;
    for i = 1:w
        Xd(:, i) = X(:, i) - mi';
    end

    m = h;

    % (4.) Compute C
    C = Xd' * Xd / (m - 1);

    % (5.) compute SVD(C)
    [U, S, V] = svd(C);

    Ub = Xd * U * ((m - 1) * S)^(-1/2);

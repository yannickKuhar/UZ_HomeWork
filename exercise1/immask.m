function I = immask(I, M)

M_int = uint8(M);

I(:,:,1) = I(:,:,1) .* M_int(:,:);
I(:,:,2) = I(:,:,2) .* M_int(:,:);
I(:,:,3) = I(:,:,3) .* M_int(:,:);

end
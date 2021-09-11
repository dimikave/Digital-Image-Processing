function ImFilt = myFilter(I)

% filter each channel separately
r = medfilt2(I(:, :, 1), [3 3]);
g = medfilt2(I(:, :, 2), [3 3]);
b = medfilt2(I(:, :, 3), [3 3]);

% reconstruct the image from r,g,b channels
ImFilt = cat(3, r, g, b);

figure
subplot(121);imshow(I);
subplot(122);imshow(ImFilt);
end
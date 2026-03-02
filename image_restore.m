% Read image
img = imread('noisy_image.jpg');

% Method 1: Gaussian filtering
img_filtered = imgaussfilt(img, 2); % sigma = 2

% Method 2: Bilateral filtering (preserves edges better)
img_bilateral = imfilter(img, fspecial('gaussian', 5, 1));

% Method 3: Non-local means denoising
img_nlm = imnlmfilt(img);

% Display results
figure;
subplot(1,2,1), imshow(img), title('Original');
subplot(1,2,2), imshow(img_filtered), title('Denoised');

% Read blurred image
blurred_img = imread('blurred_image.jpg');

% Create blur kernel
PSF = fspecial('motion', 21, 11); % motion blur

% Method 1: Wiener filtering
restored = deconvwnr(blurred_img, PSF, 1);

% Method 2: Lucy-Richardson deconvolution
restored = deconvlucy(blurred_img, PSF, 20);

% Display
figure;
subplot(1,2,1), imshow(blurred_img), title('Blurred');
subplot(1,2,2), imshow(restored), title('Restored');

% Create a mask of regions to restore
img = imread('image.jpg');
mask = zeros(size(img));
mask(100:150, 100:150) = 1; % Define region to inpaint

% Inpaint the region
restored = inpaintCoherent(img, mask);

imshow(restored);

% Upscale low-resolution image
low_res = imread('low_res_image.jpg');

% Method 1: Interpolation
high_res = imresize(low_res, 2, 'bicubic');

% Method 2: Deep learning (requires Deep Learning Toolbox)
net = resnetSRGANNetwork;
high_res = predict(net, low_res);

imshow(high_res);

img = imread('image.jpg');

% Histogram equalization
img_enhanced = histeq(img);

% Adaptive histogram equalization
img_adaptive = adapthisteq(img);

% Display comparison
figure;
subplot(1,3,1), imshow(img), title('Original');
subplot(1,3,2), imshow(img_enhanced), title('Equalized');
subplot(1,3,3), imshow(img_adaptive), title('Adaptive');

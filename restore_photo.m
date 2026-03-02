% 1. 读取并预处理图像
img = imread('old_photo.jpg'); 
if size(img, 3) == 3
    grayImg = rgb2gray(img); % 如果是彩色，先转为灰度处理划痕
else
    grayImg = img;
end
grayImg = im2double(grayImg);

% 2. 修复划痕 (使用阈值创建遮罩并修补)
% 假设划痕是明亮的白点/线
mask = grayImg > 0.9; 
% 使用 [regionfill](https://www.mathworks.com) 填充遮罩区域
restored_scratches = regionfill(grayImg, mask);

% 3. 去除噪点 (使用中值滤波去除颗粒感)
% [medfilt2](https://www.mathworks.com/help/images/ref/medfilt2.html) 对盐噪声效果极佳
denoised_img = medfilt2(restored_scratches, [3 3]);

% 4. 增强对比度 (使用 CLAHE 算法)
% [adapthisteq](https://www.mathworks.com/help/images/ref/adapthisteq.html) 能在不丢失细节的情况下提升对比度
enhanced_img = adapthisteq(denoised_img, 'ClipLimit', 0.02);

% 5. (可选) 去除模糊 - 维纳滤波
% 如果知道模糊类型（如运动模糊），可用 [deconvwnr](https://www.mathworks.com)
psf = fspecial('gaussian', [5 5], 2); % 假设高斯模糊
final_img = deconvwnr(enhanced_img, psf, 0.01);

% 6. 显示对比结果
figure;
subplot(1,2,1); imshow(img); title('原始老照片');
subplot(1,2,2); imshow(final_img); title('修复后照片');

% 7. 保存结果
imwrite(final_img, 'restored_photo.jpg');

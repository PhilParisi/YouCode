%%%%% BASIC IMAGE PROCESSING
clc, clear all, close all, format compact

% Load an image into the workspace
img = imread("bridge.jpg");

        % can also provide full file path "C:\myFolder\myImage.ext"
        % also relative folder "\myFolder\myImage.ext"

% Rotate image
img = imrotate(img,-90);


% Display image on a figure
imshow(img);


% Save an image
imwrite(img,"bridge2.jpg")



%% Grayscale and Histogram Equalization
clc, clear all, close all, format compact

img = imread("pyramid.jpg");    % load image
figure, imshow(img)             % show image on new figure

img = rgb2gray(img);            % convert to grayscale (reqd for hist)
figure, imshow(img);
img_raw = img;                  % raw copy for comparisons


% Equalize Histogram
img = histeq(img);
figure, imshowpair(img_raw,img,'montage')





%% Thresholding Images
clc, clear all, close all, format compact

img = imread("bridge.jpg");         % load image
img = rgb2gray(img);                % convert to grayscale
img = imrotate(img,-90);            % rotate
img_raw = img;                      % raw copy for comparisons
figure, imshow(img_raw)


% Thresholding
threshold = 0.88;
img = imbinarize(img, threshold);   % split image based on threshold
figure, imshowpair(img_raw,img,'montage')






%% Blur and Sharpen Images
% A Few Basic Filters
clc, clear all, close all, format compact

img = imread("bridge.jpg");         % load image
%img = rgb2gray(img);               % convert to grayscale
img = imrotate(img,-90);            % rotate
img_raw = img;                      % raw copy for comparisons
figure, imshow(img_raw)


% BLUR - create a 'blur mask'
blur = fspecial('average',50);     % create blur mask
img = imfilter(img,blur);          % apply mask to img

figure, imshowpair(img_raw,img,'montage')

% Does this help our thresholding?
img = rgb2gray(img);
threshold = 0.7;
img = imbinarize(img, threshold);   % split image based on threshold
figure, imshowpair(img_raw,img,'montage')




%% Blur and Sharpen Images
% A Few Basic Filters
clc, clear all, close all, format compact

img = imread("bridge.jpg");         % load image
%img = rgb2gray(img);               % convert to grayscale
img = imrotate(img,-90);            % rotate
img_raw = img;                      % raw copy for comparisons
figure, imshow(img_raw)

% Sharpen Image
%img = imsharpen(img);
img = imsharpen(img,'Amount',2,'Radius',1);
figure, imshowpair(img_raw,img,'montage')


% Does this help with thresholding?
img = rgb2gray(img);
threshold = 0.9;
img = imbinarize(img, threshold);   % split image based on threshold
figure, imshowpair(img_raw,img,'montage')





%% Random Noise Filtering
clc, clear all, close all, format compact

img = imread("bridge.jpg");         % load image
img = rgb2gray(img);                % convert to grayscale
img = imrotate(img,-90);            % rotate
img_raw = img;                      % raw copy for comparisons
%figure, imshow(img_raw)


%%% Add Random Noise

% first convert image from uint8 to double
img = im2double(img);               % values go from 0 to 1!

% create our noise
%dims = size(img_raw);               % store size of image
%noise = randn(dims)./10;            % generate random values
%img = img + noise;                  % add noise to the image
img = imnoise(img,'speckle', 0.02);
figure, imshowpair(img_raw,img,'montage')

% Filter out Noise w/ Median Filter
img = medfilt2(img);
figure, imshowpair(img_raw,img,'montage')



%% Homomorphic Filtering
clc, clear all, close all, format compact

img = imread("pyramid.jpg");        % load image
img = rgb2gray(img);                % convert to grayscale
%img = imrotate(img,-90);           % rotate

img = img(400:end,:);             % chop off top of image
img_raw = img;                      % raw copy for comparisons
figure, imshow(img_raw)

% Remove lighting Effects with Homomorphic Filter (sort of)
img = homomorph(img,2);
figure, imshowpair(img_raw,img,'montage')




%% Morphological Operations Images
clc, clear all, close all, format compact

img = imread("bridge.jpg");         % load image
img = rgb2gray(img);                % convert to grayscale
img = imrotate(img,-90);            % rotate
img_raw = img;                      % raw copy for comparisons

% Thresholding
threshold = 0.35;                  
img = imbinarize(img, threshold);   % split image based on threshold
figure, imshowpair(img_raw,img,'montage')
img_thresh = img;

% Morphological Operations
% open --> all white px of that size are kept, rest black (erode, dilate)
% close --> all black px of that size are kept, rest white (dilate, erode)

% isolate landmasses
SE = strel('disk',10);
img = imclose(img,SE);
SE = strel('disk',30);
img = imopen(img,SE);

figure, imshowpair(img_thresh,img,'montage')


% Calculate Statistics (Percent Coverage)
        % px values: white = 1, black = 0
black_px = sum(sum(img == 0))
white_px = sum(sum(img == 1))
total_px = size(img,1)*size(img,2)

per_land = black_px / total_px * 100







%% Cropping an Image
clc, clear all, close all, format compact

img = imread("pyramid.jpg");        % load image
%img = rgb2gray(img);                % convert to grayscale
img_raw = img;                      % raw copy for comparisons
imshow(img_raw)

img = img(1600:end,500:1200,:);
imshow(img)

% Save an image
imwrite(img,"pyramid2.jpg")








%% Raw Downsampling with Decimation
clc, clear all, close all, format compact

img = imread("pyramid.jpg");        % load image
img = rgb2gray(img);                % convert to grayscale
img_raw = img;                      % raw copy for comparisons
%figure, imshow(img_raw)

blur = fspecial('average',5);     % create blur mask
img = imfilter(img,blur);          % apply mask to img

% Downsample
img = img(1:2:end,1:5:end);

% Save an image
%imwrite(img,"pyramid2.jpg")

% Display Photos
figure, imshow(img_raw), figure, imshow(img)







%% Convert Color Spectrums
% Color, Grayscale, Hue-Saturation-Value (HSV)
clc, clear all, close all, format compact

img = imread("bridge.jpg");        % load image
img = imrotate(img,-90);           % rotate image
img_raw = img;                     % raw copy for comparisons
figure, imshow(img_raw), pause(0.5), title('Raw Image')


%%%% Grayscale
img = rgb2gray(img_raw);
figure, imshow(img), pause(0.5), title('Grayscale')

%%%% Traditional Color
% Split into RGB channels (X,Y,3 --> three of X,Y,1)
% high values indicate contribution (white = big contribution)
%[R, G, B] = imsplit(img_raw);
R = img_raw(:,:,1); G = img_raw(:,:,2); B = img_raw(:,:,3);
figure, imshow(R), pause(0.5), title('Red')
figure, imshow(G), pause(0.5), title('Green')
figure, imshow(B), pause(0.5), title('Blue')

% Edit Pixel Values
G(:,:) = 0;

% Recombine Color Channels into an Image
recreated_RGB = cat(3,R,G,B);
figure, imshow(recreated_RGB), pause(0.5), title('Recreated Image with no Green')


%%%% Hue Saturation Value
img = rgb2hsv(img_raw);
[H, S, V] = imsplit(img);
figure, imshow(H), pause(0.5), title('Hue')
figure, imshow(S), pause(0.5), title('Saturation')
figure, imshow(V), pause(0.5), title('Value')
recreated_HSV = cat(3,H,S,V);
figure, imshow(recreated_HSV), pause(0.5), title('Recreated HSV')
        % HSV will look a bit odd





%% Dynamic Plot Titles
clc, clear all, close all, format compact

img = imread("bridge.jpg");         % load image
img = rgb2gray(img);                % convert to grayscale
img = imrotate(img,-90);            % rotate
img_raw = img;                      % raw copy for comparisons
figure, imshow(img_raw)


% Thresholding
threshold = 0.3:0.1:0.8;
for i = 1:length(threshold)
    img = img_raw; % bring in a fresh copy
    img = imbinarize(img, threshold(i));   % split image based on threshold
    
    title_str = strcat("Threshold set to: ", num2str(threshold(i)));
    figure, imshow(img), pause(0.1)
    title(title_str)
end





%% Multi-Thresh
clc, clear all, close all, format compact

img = imread("bridge.jpg");         % load image
img = rgb2gray(img);                % convert to grayscale
img = imrotate(img,-90);            % rotate
img_raw = img;                      % raw copy for comparisons
figure, imshow(img_raw)


% Multiple Thresholds
splits = 20;                        % # thresholds to split on
thresh = multithresh(img, splits);  % multi-level Otsu's Method 
img = imquantize(img, thresh); 
img = img - 1;
img = img ./ splits;                % scale between 0 and 1
figure, imshowpair(img_raw,img,'montage')
title_str = strcat("Raw Image (left), Multi-Level Otsu with ",...
    num2str(splits), " Thresholds (right)"); pause(0.3)
title(title_str);















%%
function [Ihmf] = homomorph(I, sigma)
% Takes in image, I
% Applies filter with coeff sigma
% Returns new image
% https://blogs.mathworks.com/steve/2013/06/25/homomorphic-filtering-part-1/

I = im2double(I);  % conver to floating point data type
I = log(1 + I); % convert to log domain

% Create a filter MxN
M = 2*size(I,1) + 1;
N = 2*size(I,2) + 1;

[X, Y] = meshgrid(1:N,1:M);
centerX = ceil(N/2);
centerY = ceil(M/2);
gaussianNumerator = (X - centerX).^2 + (Y - centerY).^2;
H = exp(-gaussianNumerator./(2*sigma.^2));
H = 1 - H;

H = fftshift(H);
If = fft2(I, M, N);
Iout = real(ifft2(H.*If));
Iout = Iout(1:size(I,1),1:size(I,2));
Ihmf = exp(Iout) - 1;

end


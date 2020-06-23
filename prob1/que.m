clear all; close all; clc

img = im2double(imread('./bg.png'));
[h, w, ~] = size(img);
% imshow(img);

points = importdata('./points.txt');


%% Curve Computation
n = size(points, 1); % number of input points

%==============================================================%
% Code here. Store the results as `result1`, `result2`
%==============================================================%

%result1 = points; % shaped [?, 2]
%result2 = points; % shaped [?, 2]

M = [-1 3 -3 1 ; 3 -6 3 0 ; -3 3 0 0 ; 1 0 0 0];
T = zeros(1,4);
G_x = zeros(4,1);
G_y = zeros(4,1);
result1 = [];
P = [];
index = 1;
for i = 1:3:n-3
    for t = 0:0.2:1
       T = [t^3 t^2 t 1]; 
       P = T*M;
       G_x = [points(i,1) ; points(i+1,1) ; points(i+2,1) ; points(i+3,1)];
       result1(index,1) = P*G_x;
       G_y = [points(i,2) ; points(i+1,2) ; points(i+2,2) ; points(i+3,2)];
       result1(index,2) = P*G_y;
       index = index + 1;
    end
end

T = zeros(1,4);
G_x = zeros(4,1);
G_y = zeros(4,1);
result2 = [];
P = [];
index = 1;
for i = 1:3:n-3
    for t = 0:0.01:1
       T = [t^3 t^2 t 1]; 
       P = T*M;
       G_x = [points(i,1) ; points(i+1,1) ; points(i+2,1) ; points(i+3,1)];
       result2(index,1) = P*G_x;
       G_y = [points(i,2) ; points(i+1,2) ; points(i+2,2) ; points(i+3,2)];
       result2(index,2) = P*G_y;
       index = index + 1;
    end
end
% Draw the polygon of the curve
f = figure;
subplot(1, 2, 1);
imshow(img);
hold on
plot(points(:, 1), points(:, 2), 'r.');
plot(result1(:, 1), result1(:, 2), 'g-');

subplot(1, 2, 2);
imshow(img);
hold on
plot(points(:, 1), points(:, 2), 'r.');
plot(result2(:, 1), result2(:, 2), 'g-');
saveas(f, '1a.png');

%% Scaling
points = points .* 4;

%==============================================================%
% Code here.
%==============================================================%
T = zeros(1,4);
G_x = zeros(4,1);
G_y = zeros(4,1);
result3 = [];
P = [];
index = 1;
for i = 1:3:n-3
    for t = 0:0.01:1
       T = [t^3 t^2 t 1]; 
       P = T*M;
       G_x = [points(i,1) ; points(i+1,1) ; points(i+2,1) ; points(i+3,1)];
       result3(index,1) = P*G_x;
       G_y = [points(i,2) ; points(i+1,2) ; points(i+2,2) ; points(i+3,2)];
       result3(index,2) = P*G_y;
       index = index + 1;
    end
end
f_2 = figure(2);
img_2 = imresize(img,4,'nearest');
imshow(img_2);
hold on
plot(points(:,1),points(:,2), 'r.');
plot(result3(:,1), result3(:,2), 'g.');
saveas(f_2, '1b.png');
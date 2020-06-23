clear all; close all; clc; 

%% Read OBJ file
obj = readObj('trump.obj');
tval = display_obj(obj,'tumpLPcolors.png');

%==============================================================%
% Code here. Move object center to (0, 0)
Center = [(max(obj.v(:,1))+min(obj.v(:,1)))/2 ; (max(obj.v(:,2))+min(obj.v(:,2)))/2 ; (max(obj.v(:,3))+min(obj.v(:,3)))/2];
obj.v(:,1) = obj.v(:,1) - Center(1,1);
obj.v(:,2) = obj.v(:,2) - Center(2,1);
obj.v(:,3) = obj.v(:,3) - Center(3,1);
%c = [(max(obj.v(:,1))+min(obj.v(:,1)))/2 ; (max(obj.v(:,2))+min(obj.v(:,2)))/2 ; (max(obj.v(:,3))+min(obj.v(:,3)))/2];
%==============================================================%

%% a.
f = figure; 
trisurf(obj.f.v, obj.v(:,1), obj.v(:,2), obj.v(:,3), ...
    'FaceVertexCData', tval, 'FaceColor', 'interp', 'EdgeAlpha', 0);
xlabel('X'); ylabel('Y'); zlabel('Z');
axis equal;
saveas(f, '2a.png');


%==============================================================%
% Code here. Other Problems
H = repmat(linspace(0, 1, 100), 100, 1);     
S = repmat([linspace(0, 1, 50) ...
            linspace(1, 0, 50)].', 1, 100);  
V = repmat([ones(1, 50) ...                  
            linspace(1, 0, 50)].', 1, 100);  
hsvImage = cat(3, H, S, V);                  
C = hsv2rgb(hsvImage);                       


theta = linspace(0, 2*pi, 100);  
X = [zeros(1, 100); ...          
     cos(theta); ...
     zeros(1, 100)];
Y = [zeros(1, 100); ...          
     sin(theta); ...
     zeros(1, 100)];
Z = [ones(2, 100); ...        
     zeros(1, 100)];
Z = Z - 1.4;

f_2 = figure(2);
trisurf(obj.f.v, obj.v(:,1), obj.v(:,2), obj.v(:,3), ...
    'FaceVertexCData', tval, 'FaceColor', 'interp', 'EdgeAlpha', 0);
hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
surf(X, Y, Z, C, 'FaceColor', 'texturemap', 'EdgeColor', 'none');
axis equal
saveas(f_2, '2b.png');
%%=========================================================================
f_3 = figure(3);
subplot(1,2,1);
trisurf(obj.f.v, obj.v(:,1), obj.v(:,2), obj.v(:,3), ...
    'FaceVertexCData', tval, 'FaceColor', 'interp', 'EdgeAlpha', 0);
hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
surf(X, Y, Z, C, 'FaceColor', 'texturemap', 'EdgeColor', 'none');
axis equal
light('Position', [-1 0 0], 'Style', 'local');

subplot(1,2,2);
trisurf(obj.f.v, obj.v(:,1), obj.v(:,2), obj.v(:,3), ...
    'FaceVertexCData', tval, 'FaceColor', 'interp', 'EdgeAlpha', 0);
hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
surf(X, Y, Z, C, 'FaceColor', 'texturemap', 'EdgeColor', 'none');
axis equal
light('Position', [-1 0 0], 'Style', 'infinite');
saveas(f_3, '2c.png');
%%=========================================================================
f_4 = figure(4);
subplot(2,2,1);
k1 = trisurf(obj.f.v, obj.v(:,1), obj.v(:,2), obj.v(:,3), ...
    'FaceVertexCData', tval, 'FaceColor', 'interp', 'EdgeAlpha', 0);
hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
k2 = surf(X, Y, Z, C, 'FaceColor', 'texturemap', 'EdgeColor', 'none');
axis equal
light('Position', [0 0 1], 'Style', 'infinite');
k1.AmbientStrength = 1.0;
k1.DiffuseStrength = 0.0;
k1.SpecularStrength = 0.0;
k2.AmbientStrength = 1.0;
k2.DiffuseStrength = 0.0;
k2.SpecularStrength = 0.0;

subplot(2,2,2);
k1 = trisurf(obj.f.v, obj.v(:,1), obj.v(:,2), obj.v(:,3), ...
    'FaceVertexCData', tval, 'FaceColor', 'interp', 'EdgeAlpha', 0);
hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
k2 = surf(X, Y, Z, C, 'FaceColor', 'texturemap', 'EdgeColor', 'none');
axis equal
light('Position', [0 0 1], 'Style', 'infinite');
k1.AmbientStrength = 0.1;
k1.DiffuseStrength = 1.0;
k1.SpecularStrength = 0.0;
k2.AmbientStrength = 0.1;
k2.DiffuseStrength = 1.0;
k2.SpecularStrength = 0.0;

subplot(2,2,3);
k1 = trisurf(obj.f.v, obj.v(:,1), obj.v(:,2), obj.v(:,3), ...
    'FaceVertexCData', tval, 'FaceColor', 'interp', 'EdgeAlpha', 0);
hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
k2 = surf(X, Y, Z, C, 'FaceColor', 'texturemap', 'EdgeColor', 'none');
axis equal
light('Position', [0 0 1], 'Style', 'infinite');
k1.AmbientStrength = 0.1;
k1.DiffuseStrength = 0.1;
k1.SpecularStrength = 1.0;
k2.AmbientStrength = 0.1;
k2.DiffuseStrength = 0.1;
k2.SpecularStrength = 1.0;

subplot(2,2,4);
k1 = trisurf(obj.f.v, obj.v(:,1), obj.v(:,2), obj.v(:,3), ...
    'FaceVertexCData', tval, 'FaceColor', 'interp', 'EdgeAlpha', 0);
hold on;
xlabel('X'); ylabel('Y'); zlabel('Z');
k2 = surf(X, Y, Z, C, 'FaceColor', 'texturemap', 'EdgeColor', 'none');
axis equal
light('Position', [0 0 1], 'Style', 'infinite');
k1.AmbientStrength = 0.1;
k1.DiffuseStrength = 0.5;
k1.SpecularStrength = 1.0;
k2.AmbientStrength = 0.1;
k2.DiffuseStrength = 0.5;
k2.SpecularStrength = 1.0;

saveas(f_4, '2d.png');



%==============================================================%
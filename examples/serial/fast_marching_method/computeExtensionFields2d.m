%
% File:        computeExtensionFields2d.m
% Copyrights:  (c) 2005 The Trustees of Princeton University and Board of
%                  Regents of the University of Texas.  All rights reserved.
%              (c) 2009 Kevin T. Chu.  All rights reserved.
% Revision:    $Revision$
% Modified:    $Date$
% Description: MATLAB script to process the data file generated by
%              computeExtensionFields2d
%

% load data file
data = load('computeExtensionFields2d.dat');
phi = data(:,1);
phi_init = data(:,2);
ext_field1 = data(:,3);
ext_field2 = data(:,4);
src_field1 = data(:,5);
src_field2 = data(:,6);

% compute the number of grid points
num_gridpts = length(phi);
N = round(sqrt(num_gridpts));

% reshape to 2D array
phi = reshape(phi,N,N); phi = phi';
phi_init = reshape(phi_init,N,N); phi_init = phi_init';
ext_field1 = reshape(ext_field1,N,N); ext_field1 = ext_field1';
ext_field2 = reshape(ext_field2,N,N); ext_field2 = ext_field2';
src_field1 = reshape(src_field1,N,N); src_field1 = src_field1';
src_field2 = reshape(src_field2,N,N); src_field2 = src_field2';

% generate mesh
dx = 2/(N-1);
X = -1:dx:1;
Y = X;

% show distance function and zero level set
figure(1); clf;
pcolor(X,Y,phi);
shading interp
view([0 90]);
hold on;
contour(X,Y,phi,[0 0],'k','LineWidth',2);
pbaspect([1 1 1]);
title('distance function');
color_axis = caxis; % get color axis to use in other plot
colorbar;

% show original level set function
figure(2); clf;
pcolor(X,Y,phi_init);
shading interp
view([0 90]);
hold on;
contour(X,Y,phi,[0 0],'k','LineWidth',2);
pbaspect([1 1 1]);
title('original level set function');
caxis(color_axis);  % set color axis to be the same as the distance function
                    % plot
colorbar;

% show source field 1
figure(3); clf;
pcolor(X,Y,src_field1);
shading interp
view([0 90]);
hold on;
contour(X,Y,phi,[0 0],'k','LineWidth',2);
pbaspect([1 1 1]);
title('source field 1');
caxis(color_axis);  % set color axis to be the same as the distance function
                    % plot
colorbar;

% show extension field 1
figure(4); clf;
pcolor(X,Y,ext_field1);
shading interp
view([0 90]);
hold on;
contour(X,Y,phi,[0 0],'k','LineWidth',2);
pbaspect([1 1 1]);
title('extension field 1');
caxis(color_axis);  % set color axis to be the same as the distance function
                    % plot
colorbar;

% show source field 2
figure(5); clf;
pcolor(X,Y,src_field2);
shading interp
view([0 90]);
hold on;
contour(X,Y,phi,[0 0],'k','LineWidth',2);
pbaspect([1 1 1]);
title('source field 2');
caxis(color_axis);  % set color axis to be the same as the distance function
                    % plot
colorbar;

% show extension field 2
figure(6); clf;
pcolor(X,Y,ext_field2);
shading interp
view([0 90]);
hold on;
contour(X,Y,phi,[0 0],'k','LineWidth',2);
pbaspect([1 1 1]);
title('extension field 2');
caxis(color_axis);  % set color axis to be the same as the distance function
                    % plot
colorbar;

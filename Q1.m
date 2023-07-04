clc;clear all;
b=(imread('background.JPG'));% read background image 
t=(imread('template.JPG'));% read template image 
[ir,ic]=size(b);% get size of background
[tr,tc]=size(t);%get size of template
t=imcrop(t,[0,0,tr,tr]);% to fix this image to real size we need to omit some trash pixels 
R=normxcorr2(t(:,:,3),b(:,:,3));% finding normal cross correlation 
R=imcrop(R,[tr,tr,ic,ir]);% crop the extra pixels
[r,c,v]=find(R==max(max(R)));% finding coordinates where maximum correlation occurs
Result=insertShape(b,'Rectangle',[c,r,tr,tr],'LineWidth',5);% create a box around maximum match
figure(1)
subplot(2,2,1)
imshow(b)
title('background')
subplot(2,2,2)
imshow(t)
title('template')
subplot(2,2,3)
imshow(R)
title('C')
subplot(2,2,4)
imshow(Result)
title('single shot detective')


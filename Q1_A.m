clc;clear all;
b=(imread('background.JPG'));% read background image
t=(imread('template.JPG'));% read template image
[ir,ic]=size(b);%
[tr,tc]=size(t);
t=imcrop(t,[0,0,tr,tr]);% to fix this image to real size we need to omit some trash pixels
tMatcher=vision.TemplateMatcher;
x=tMatcher(b(:,:,3),t(:,:,3));
Result=insertShape(b,'Rectangle',[x(1),x(2),tr,tr],'LineWidth',5);%create a box around maximum match
figure(1)
imshow(Result)
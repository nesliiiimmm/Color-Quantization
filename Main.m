clc;
clear all;
close all;
fileName='Prova.jpg';
noOfColors=4;%bu sayý arttýkça yavaþlýyor..
final=mediancut(fileName,noOfColors);
imshow(final);
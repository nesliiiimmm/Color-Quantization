clc;
clear all;
close all;
fileName='Prova.jpg';
noOfColors=4;%bu say� artt�k�a yava�l�yor..
final=mediancut(fileName,noOfColors);
imshow(final);
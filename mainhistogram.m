clc;
clear all;
close all;
fileName='C:\Users\Neslihan Ak\Pictures\Camera Roll\Prova.jpg';
%ext='resim.jpeg';
noOfColors=4;%bu say� artt�k�a yava�l�yor..
e=imread(fileName);
%k=rgb2gray(e);
image_hist_RGB_3d(fileName,6,0.5);
function Jarvis(image)
%Jarvis
%clc;clear all;close all;
%INPUT = image;
%image = [Path, File];
in_img = imread(image);
%imshow(in_img);title('Input Image');
inImg = double(in_img);
[M,N] = size(inImg);
x = inImg;
y = inImg;
Threshold = 128;

for Y = 1: +1 : N
    for X = 1: +1 : M
            if y(X,Y) > Threshold
                error = -255 + y(X,Y);
                y(X,Y) = 255;                
            else
                error = 0 + y(X,Y);
                y(X,Y) = 0;                
            end
            %Boundary Condition
            
            if X == 1 && Y < N-1 %Left Column X == 1
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X+2,Y) = y(X+2,Y)+(5/48)*error;
                y(X,Y+1) = y(X,Y+1)+(7/48)*error;
                y(X+1,Y+1) = y(X+1,Y+1)+(5/48)*error;
                y(X+2,Y+1) = y(X+2,Y+1)+(3/48)*error;
                y(X,Y+2) = y(X,Y+2)+(5/48)*error;
                y(X+1,Y+2) = y(X+1,Y+2)+(3/48)*error;
                y(X+2,Y+2) = y(X+2,Y+2)+(1/48)*error;
                           
            elseif X == 1 && Y == N-1 %BottomLeftBox
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X+2,Y) = y(X+2,Y)+(5/48)*error;
                y(X,Y+1) = y(X,Y+1)+(7/48)*error;
                y(X+1,Y+1) = y(X+1,Y+1)+(5/48)*error;
                y(X+2,Y+1) = y(X+2,Y+1)+(3/48)*error;
                
            elseif X==2 && Y==N-1
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X+2,Y) = y(X+2,Y)+(5/48)*error;
                y(X-1,Y+1) = y(X-1,Y+1)+(5/48)*error;
                y(X,Y+1) = y(X,Y+1)+(7/48)*error;
                y(X+1,Y+1) = y(X+1,Y+1)+(5/48)*error;
                y(X+2,Y+1) = y(X+2,Y+1)+(3/48)*error;

            elseif X==1 && Y==N
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X+2,Y) = y(X+2,Y)+(5/48)*error;
                
            elseif X==2 && Y==N
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X+2,Y) = y(X+2,Y)+(5/48)*error;

            elseif X==M-1 && Y==N-1
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X-2,Y+1) = y(X-2,Y+1)+(3/48)*error;
                y(X-1,Y+1) = y(X-1,Y+1)+(5/48)*error;
                y(X,Y+1) = y(X,Y+1)+(7/48)*error;
                y(X+1,Y+1) = y(X+1,Y+1)+(5/48)*error;

            elseif X==M && Y==N-1
                y(X-2,Y+1) = y(X-2,Y+1)+(3/48)*error;
                y(X-1,Y+1) = y(X-1,Y+1)+(5/48)*error;
                y(X,Y+1) = y(X,Y+1)+(7/48)*error;
                
            elseif X==M-1 && Y==N
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                
            elseif X==M && Y==N
                %Do Nothing
                               
            elseif X == 2 && Y < N-1 %Left Column X = 2
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X+2,Y) = y(X+2,Y)+(5/48)*error;
                y(X-1,Y+1) = y(X-1,Y+1)+(5/48)*error;
                y(X,Y+1) = y(X,Y+1)+(7/48)*error;
                y(X+1,Y+1) = y(X+1,Y+1)+(5/48)*error;
                y(X+2,Y+1) = y(X+2,Y+1)+(3/48)*error;
                y(X-1,Y+2) = y(X-1,Y+2)+(3/48)*error;
                y(X,Y+2) = y(X,Y+2)+(5/48)*error;
                y(X+1,Y+2) = y(X+1,Y+2)+(3/48)*error;
                y(X+2,Y+2) = y(X+2,Y+2)+(1/48)*error;

                
            elseif X == M-1 && Y < N-1 %Right Column X == M-1
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X-2,Y+1) = y(X-2,Y+1)+(3/48)*error;
                y(X-1,Y+1) = y(X-1,Y+1)+(5/48)*error;
                y(X,Y+1) = y(X,Y+1)+(7/48)*error;
                y(X+1,Y+1) = y(X+1,Y+1)+(5/48)*error;
                y(X-2,Y+2) = y(X-2,Y+2)+(1/48)*error;
                y(X-1,Y+2) = y(X-1,Y+2)+(3/48)*error;
                y(X,Y+2) = y(X,Y+2)+(5/48)*error;
                y(X+1,Y+2) = y(X+1,Y+2)+(3/48)*error;
                
            elseif X == M && Y < N-1 %Right Column X == M
                y(X-2,Y+1) = y(X-2,Y+1)+(3/48)*error;
                y(X-1,Y+1) = y(X-1,Y+1)+(5/48)*error;
                y(X,Y+1) = y(X,Y+1)+(7/48)*error;
                y(X-2,Y+2) = y(X-2,Y+2)+(1/48)*error;
                y(X-1,Y+2) = y(X-1,Y+2)+(3/48)*error;
                y(X,Y+2) = y(X,Y+2)+(5/48)*error;

                
            elseif 2<X<M-1 && Y==N-1
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X+2,Y) = y(X+2,Y)+(5/48)*error;
                y(X-2,Y+1) = y(X-2,Y+1)+(3/48)*error;
                y(X-1,Y+1) = y(X-1,Y+1)+(5/48)*error;
                y(X,Y+1) = y(X,Y+1)+(7/48)*error;
                y(X+1,Y+1) = y(X+1,Y+1)+(5/48)*error;
                y(X+2,Y+1) = y(X+2,Y+1)+(3/48)*error;

            elseif 2<X<M-1 && Y==N
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X+2,Y) = y(X+2,Y)+(5/48)*error;
                
            else %All the other Pixel
                y(X+1,Y) = y(X+1,Y)+(7/48)*error;
                y(X+2,Y) = y(X+2,Y)+(5/48)*error;
                y(X-2,Y+1) = y(X-2,Y+1)+(3/48)*error;
                y(X-1,Y+1) = y(X-1,Y+1)+(5/48)*error;
                y(X,Y+1) = y(X,Y+1)+(7/48)*error;
                y(X+1,Y+1) = y(X+1,Y+1)+(5/48)*error;
                y(X+2,Y+1) = y(X+2,Y+1)+(3/48)*error;
                y(X-2,Y+2) = y(X-2,Y+2)+(1/48)*error;
                y(X-1,Y+2) = y(X-1,Y+2)+(3/48)*error;
                y(X,Y+2) = y(X,Y+2)+(5/48)*error;
                y(X+1,Y+2) = y(X+1,Y+2)+(3/48)*error;
                y(X+2,Y+2) = y(X+2,Y+2)+(1/48)*error;
                
            end
            
    end
end
img = y;
%outFilename = [Path, 'Dithering_', File];
%imshow(halftone_img);
%figure;imshow(halftone_img);title('Jarvis Error Diffusion');
%imwrite(img,outFilename);
imshow(img);
%Gauss_img = imgaussfilt(y,1.3); %GaussianFilter
%HPSNR = psnr(Gauss_img,x,255)
end

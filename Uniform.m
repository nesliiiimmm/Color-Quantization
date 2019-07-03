function B=Uniform(A,ColorOfNumber)
%A=img;  
switch ColorOfNumber
    case 2;
        Result=400;
    case 4;
        Result=350;
    case 8;
        Result=300;
    case 16;
        Result=200;
    case 32;
        Result=100;
    case 64;
        Result=75;
    case 128;
        Result=50;
    case 256;
        Result=25;
    case 512;
        Result=15;
    otherwise
        Result=ColorOfNumber;
end 
[M,N,Z]=size(A);  
q=Result;%%burasý arttýðýnda rengin sayýsý azalýyor.. 
B=zeros(M,N,Z,'uint8'); 
D1=0; 
D2=0; 
D3=0; 
for m=1:M; 
    for n=1:N; 
        k1=A(m,n,1)/q; 
        k2=A(m,n,2)/q; 
        k3=A(m,n,3)/q; 
        B(m,n,1)=k1*q+q/2; 
        B(m,n,2)=k2*q+q/2; 
        B(m,n,3)=k3*q+q/2; 
    end 
end 
 
A1=im2double(A).*255; 
B1=im2double(B).*255;  
for m=1:M; 
    for n=1:N; 
        D1=D1+((A1(m,n,1)-B1(m,n,1))^2)/(M*N); 
        D2=D2+((A1(m,n,2)-B1(m,n,2))^2)/(M*N); 
        D3=D3+((A1(m,n,3)-B1(m,n,3))^2)/(M*N); 
    end 
end 
 
D1 
D2 
D3 
%imshow(B)
end
 
clear all;
clf;
[y,fs]=wavread('C:\Users\Toshiba\Desktop\project\wave files\1.wav');
%disp(fs);
figure(1);
plot(y);
title('WAVE FILE');
%calculating dct
sound(y);
x=dct(y);
figure(2);
plot(x);
title('DCT');
[s,w]=size(x);

 
% Converting into segments

seg=s/20;

k=1;
for i=1:1:20
    enrgy(i)=0;
    for j=1:1:seg
        temp(i,j)=x(k);
        k=k+1;
        enrgy(i)=enrgy(i)+(temp(i,j)*temp(i,j)); %calculates energy
    end
end
% disp('energy of each segment')
%disp(enrgy);
figure(3);
plot(enrgy);
title('ENERGY');
[s1 s2]=size(enrgy);
p=size(temp);
%disp(p);
%finds highest energy segment

hi_enrgy=max(enrgy);
for i=1:1:s2
    if enrgy(i)==hi_enrgy
        break,
    end
end
seg_pos=i;
%disp(seg_pos); %position of highest energy segment
for j=1:1:seg
    %disp(temp(i,j));
    z(j)=temp(i,j);
end
%generates a sequence of normal distribution
%  w_mark=randn(5);
% % [r1,c1]=size(w_mark);
% % disp(w_mark);
t = 0:.1:50;
w_mark= sin(t);
[r1,c1]=size(w_mark);
k=1;
for i=1:1:r1
    for j=1:1:c1
        asd(k)=w_mark(i,j);
        k=k+1;
    end
end
figure(5)
plot(asd);
title('WATERMARK');

%finds highest peak
for j=1:1:r1*c1      
    m=0;
    for i=1:1:seg
        if z(i)>m
            m=z(i);
            pos(j)=i;  %stores position of highest peak
        end
    end
    high(j)=m;
    for k=1:1:seg
        if m==z(k)
            z(k)=0;
        end
    end
    
end
% disp('highest peak values');
% disp(high);

%inserting watermark
j=1;
for i=1:1:r1
    for l=1:1:c1
        w_sgnl(i,l)=high(j)*(1+0.2*w_mark(i,l));   %calculation of watermarked sequence
        j=j+1;
    end
end
% disp('watermarked sequence');
% disp(w_sgnl);
% disp('highest peak position');
% disp(pos);

%inserting watermark in the highest peak position
k=1;
for i=1:1:r1
    for j=1:1:c1
        z(pos(k))=w_sgnl(i,j);
        k=k+1;
    end
end
%disp(z);

h=(seg_pos-1)*seg;  
%disp(h)

%inserting back into original position
for i=1:1:seg
    h=h+1;
    x(h)=z(i);
end
% re=ab.*cos(an);
% im=ab.*sin(an);
% real=re+(i*b);
invr=idct(x);
figure(4)
plot(invr);
title('Watermarked Signal');
sound(invr);
save watermarks;













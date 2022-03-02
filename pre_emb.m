
function [high,pos]=pre_emb(y,r1,c1)
x=dct(y);
s=size(x);
 
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
[s1 s2]=size(enrgy);
hi_enrgy=max(enrgy);
for i=1:1:s1
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
end


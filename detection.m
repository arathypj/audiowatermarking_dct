load watermarks.mat;
%disp(y);
invr=awgn(invr,70);
[hi,p]=pre_emb(y,r1,c1);
az=((seg_pos-1)*seg);
for i=1:1:r1*c1
    ak(i)=az+p(i);
    
end
tw=dct(invr);

for i=1:1:r1*c1
    invw(i)=tw(ak(i));
    xs(i)=((invw(i)/hi(i))-1)/0.2;
end
%disp(xs);
figure(6)






%similarity
tmp=w_mark*xs';
sq=xs*xs';
sim=tmp/sqrt(sq);
% disp(size(w_mark));
% disp(size(xs));
% disp(size(sas));
% disp(size(fi));
% disp(size(dsa));
disp(sim);

%snr
p=y.*y;
dh=0;
for i=1:1:s
    dh=dh+p(i);
end
r=(y-invr).*(y-invr);
dm=0;
for i=1:1:s
    dm=dm+r(i);
end
f=dh/dm;
snr=10*log10(f);
disp(snr);
plot(xs);

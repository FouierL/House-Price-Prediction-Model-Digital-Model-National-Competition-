
yq=y-14188;
a1=10.*exp(-(d1./1000));
a2=10.*exp(-(d2./1000));
a=a1+a2;
der=der1+der2;
X = [ones(size(a1)) a der a.*der];
[ses,BINT,R,RINT,STATS] = regress(yq,X,0.05)
scatter3(a,der,yq,'filled')
hold on
afit = min(a):0.01:max(a);
derfit = min(der):0.01:max(der);
[AFIT,DERFIT] = meshgrid(afit,derfit);
YFIT = ses(1) + ses(2)*AFIT + ses(3)*DERFIT + ses(4)*AFIT.*DERFIT;
mesh(AFIT,DERFIT,YFIT)
xlabel('公共设施便利程度')
ylabel('小区品质和教育质量')
zlabel('房价')
view(50,10)
hold off
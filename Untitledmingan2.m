syms x1 x2 a %定义符号变量
f=-55766.2127807406+2224.01066127644*x1+3790.64871404110*x2-95.3877492926356*x1*x2*a;
f=simplify(f) %化简目标函数
f1=diff(f,x1), f2=diff(f,x2)  %求目标函数关于x1,x2的偏导数
[x10,x20]=solve(f1,f2)  %求驻点
pretty(x10), pretty(x20)  %以书写习惯的方式显示
subplot(121), fplot(x10,[0.002,0.02]), title('')  %画x1关于a的曲线
xlabel('$t$','Interpreter','Latex')
ylabel('$x_1$','Interpreter','Latex','Rotation',0)
subplot(122), fplot(x20,[0.002,0.02]), title('')  %画x2关于a的曲线
xlabel('$t$','Interpreter','Latex')
ylabel('$x_2$','Interpreter','Latex','Rotation',0)
dx1=diff(x10,t), dx10=subs(dx1,t,0.01), dx10=double(dx10)
sx1a=dx10*0.01/4735
dx2=diff(x20,t), dx20=subs(dx2,t,0.01), dx20=double(dx20)
sx2a=dx20*0.01/7043  
F=subs(f,{x1,x2},{x10,x20}) %求关于a的目标函数
F=simplify(F)
figure, fplot(F,[0.002,0.02]), title('')
xlabel('$t$','Interpreter','Latex')
ylabel('$y$','Interpreter','Latex','Rotation',0)
Sya=-4735^2*0.01/553641
f3=subs(f,{x1,x2,t},{4735,7043,0.011}); f3=double(f3)  %计算近似最优利润
f4=subs(F,a,0.011); f4=double(f4)  %计算最优利润
delta=(f4-f3)/f4  %计算利润的相对误差
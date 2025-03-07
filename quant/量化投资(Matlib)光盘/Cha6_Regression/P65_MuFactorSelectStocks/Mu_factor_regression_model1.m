%% 多因子选股模型
%《量化投资：数据挖掘技术与实践》第6章配套程序，电子工业出版社，卓金武等编著，70263215@qq.com 
%% 导入数据
clc, clear all, close all
s = dataset('xlsfile', 'SampleA1.xlsx');

%% 多元线性回归
myFit = LinearModel.fit(s);
disp(myFit) 
sx=s(:,1:10);
sy=s(:,11);
n=1:size(s,1);
sy1= predict(myFit,sx);
figure
plot(n,sy, 'ob', n, sy1,'*r')
xlabel('样本编号', 'fontsize',12)
ylabel('综合得分', 'fontsize',12)
title('多元线性回归模型', 'fontsize',12)
set(gca, 'linewidth',2)

%% 逐步回归
myFit2 = LinearModel.stepwise(s);
disp(myFit2)
sy2= predict(myFit2,sx);
figure
plot(n,sy, 'ob', n, sy2,'*r')
xlabel('样本编号', 'fontsize',12)
ylabel('综合得分', 'fontsize',12)
title('逐步回归模型', 'fontsize',12)
set(gca, 'linewidth',2)
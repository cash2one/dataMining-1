function Solution=proarc_gradient(e,x0,Q,b,showplot)
% minf=1/2x'Qx+bx,Q is semi-positive definite
% e 误差极限
% x0 初始点
% Q,b二次规划参数
% showplot 作图与否0,1
% Max_iter 5000

%初始化
time1=clock;
beta=0.6;sigma=1e-4;s_bar=1;Max_iter=5000;
f_new=zeros(Max_iter,1);
x_change=zeros(Max_iter,1);
iter=1;

x0=projection(x0);
[~,x1]=armjforproarc(x0,Q,b,sigma,beta,s_bar);

% 迭代开始
while(iter<Max_iter)
    f_new(iter)=f(Q,b,x0); %记录目标值变化
    x_change(iter)=norm((x1-x0),1);%记录xk与xk+1差异
    if abs(x1'*fx(Q,b,x1))<e
        break;%终止条件
    end
    x0=x1;
    iter=iter+1;
    [~,x1]=armjforproarc(x0,Q,b,sigma,beta,s_bar);
    
end
time=etime(clock,time1);

%output
Solution.x=x1;
Solution.min=f_new(iter);
Solution.f_new=f_new(1:iter);
Solution.x_change=x_change(1:iter);
Solution.iter=iter;
Solution.time=time;
figure;
if(showplot)
    subplot(2,1,1);
    plot(Solution.x_change,'or');
    hold on;
    plot(Solution.x_change,'-b');
    title('x收敛性：diff(x)');
    xlabel('iter');
    ylabel('error');
    hold off;
    subplot(2,1,2);
    plot(Solution.f_new,'or');hold on;
    plot(Solution.f_new,'-b');hold off;
    title('目标值变化');
    xlabel('iter');
    ylabel('f');
end





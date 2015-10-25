function Solution=conststep_gradient(e,x0,Q,b,showplot)
% minf=1/2Q'xQ+bx,Q is semi-positive definite
% max_iter 最大迭代数
% e 误差极限
% x0 初始点
% Q,b二次规划参数
% showplot 作图与否0,1
% fix  alpha=1 s足够小


time1=clock;
%s=1/(length(Q)*100);
if(max(eig(Q)))>0
    s=1/max(eig(Q));
end
Max_iter=5000;
x0=projection(x0);
f_new=zeros(Max_iter,1);
err=zeros(Max_iter,1);
iter=1;%初始化

f0=f(Q,b,x0);
fx0=fx(Q,b,x0);
p=x0-s*(fx0);
x1=projection(p);
f_new(1)=f0;
err(1)=norm((x1-x0),1);
while(abs(x1'*fx(Q,b,x1))>e && iter<Max_iter)
    iter=iter+1;
    x0=x1;
    f0=f(Q,b,x0);
    fx0=fx(Q,b,x0);
    p=x0-s*(fx0);
    x1=projection(p);
    f_new(iter)=f0;
    err(iter)=norm((x1-x0),1);
end
time=etime(clock,time1);

%output
Solution.x=x1;
Solution.min=f_new(iter);
Solution.f_new=f_new(1:iter);
Solution.x_err=err(1:iter);
Solution.iter=iter;
Solution.time=time;
if(showplot)
    figure;
    subplot(2,1,1);
    plot(Solution.x_err,'or');
    hold on;
    plot(Solution.x_err,'-b');
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





function Solution=proarc_gradient(e,x0,Q,b,showplot)
% minf=1/2x'Qx+bx,Q is semi-positive definite
% e ����
% x0 ��ʼ��
% Q,b���ι滮����
% showplot ��ͼ���0,1
% Max_iter 5000

%��ʼ��
time1=clock;
beta=0.6;sigma=1e-4;s_bar=1;Max_iter=5000;
f_new=zeros(Max_iter,1);
x_change=zeros(Max_iter,1);
iter=1;

x0=projection(x0);
[~,x1]=armjforproarc(x0,Q,b,sigma,beta,s_bar);

% ������ʼ
while(iter<Max_iter)
    f_new(iter)=f(Q,b,x0); %��¼Ŀ��ֵ�仯
    x_change(iter)=norm((x1-x0),1);%��¼xk��xk+1����
    if abs(x1'*fx(Q,b,x1))<e
        break;%��ֹ����
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
    title('x�����ԣ�diff(x)');
    xlabel('iter');
    ylabel('error');
    hold off;
    subplot(2,1,2);
    plot(Solution.f_new,'or');hold on;
    plot(Solution.f_new,'-b');hold off;
    title('Ŀ��ֵ�仯');
    xlabel('iter');
    ylabel('f');
end





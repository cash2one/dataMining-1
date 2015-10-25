%% main
clc;clear;close all;
size=1000;
Q=randi([-10,10],size*2,size);
Q=Q'*Q;
b=randi([-100,0],size,1);
e=1e-5;
x0=zeros(size,1);
Solution1=proarc_gradient(e,x0,Q,b,1);
Solution2=conststep_gradient(e,x0,Q,b,1);

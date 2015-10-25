function f=f(Q,b,X)
%f=1/2*X'*Q*X+b'*X
%fx=Qx+b

% syms x1;
% X=[x1];
% for i=2:length(Q)
% syms(['x',num2str(i)]);
% X=[X;['x',num2str(i)]];
% end
% f=1/2*X'*Q*X+b'*X;%Ä¿±êº¯Êý
% fx=Q*X+b;

%fx=diff(f,'x1');
% for i=2:length(Q)
% syms(['x',num2str(i)]);
% fx=[fx;diff(f,['x',num2str(i)])];
% end

f=1/2*X'*Q*X+b'*X;
end




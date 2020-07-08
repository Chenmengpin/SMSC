warning off


alpha=1e-5;
gamma =0.05;
beta=3000;
result=[];
[~,p]=size(Yanexpression);
label=Yanexpression(:,p);
 a=selfweightmkl(allkernel,label,alpha,beta,gamma)
result=[result; a];
xlswrite(['Yan_SMSC_result' '.xlsx'], result)


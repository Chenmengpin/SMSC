function [result]=selfweightmkl(H,s,alpha,beta,gamma)
% s is the true class label.
warning off
[m,n,nn]=size(H);
sumK=zeros(n);
for i=1:nn
    sumK=sumK+H(:,:,i);
end
K=sumK/nn;
Z=eye(n);
c=length(unique(s));
itt = 0;
for i=1:100
    itt = i;
    Zold=Z;

    D = diag(sum(Z));
    L = D-Z;
    
    [F, temp, ev]=eig1(L, c, 0);
    sumH=zeros(n);
    sum1=0;
    for j=1:nn
        temp(j)=norm(H(:,:,j)-K,'fro');
        omega(j)=1/(2*temp(j));
        sumH=sumH+omega(j)*H(:,:,j);
        sum1=sum1+omega(j);
    end

    for ij=1:n
        for ji=1:n
            all(ji)=norm(F(ij,:)-F(ji,:));
        end

        Z(:,ij)=(K+gamma*eye(n))\(K(ij,:)'-alpha/4*all');
        end
    Z(find(Z<0))=0;
    Z= (Z+Z')/2;
    K=(2*Z'-Z*Z'-eye(n)+2*beta*sumH)/(2*beta*sum1);
    K(find(K<0))=0;
    K=(K'+K)/2;
    if i>5 &((norm(Z-Zold)/norm(Zold))<1e-5)
        break
    end
end
actual_ids= kmeans(F, c, 'emptyaction', 'singleton', 'replicates', 100, 'display', 'off');
[result] = [ClusteringMeasure_new( actual_ids,s) itt];

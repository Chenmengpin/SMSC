% seven guassion kernels 
Dataset=Yanexpression；
[~,n]=size(Dataset);
Dataset1=Dataset(:,1:n-1);
label=Dataset(:,n);
% [COEFF,ProjectedTraining]=pca(Dataset1);
Dataset2=Dataset1;
% function [allkernel]=computeKernel(Dataset1,Dataset2)
    num=0;
    for t=[0.01,0.1,0.05,1,10,50,100]
    % K=kernelsim(Dataset1,Dataset2,t);% Dataset:行数*维度数
        for i = 1 : size(Dataset1,1)-1      
            for j=i+1:size(Dataset2,1)
                d(i,j)=norm(Dataset1(i,:)-Dataset2(j,:));
                d(i,i)=0;
                d(j,i)=d(i,j);
            end
        end
        [dmax, ~] = max(d(:));
%         dmax=max(d);
         for i = 1 : size(Dataset1,1)-1      
            for j=i+1:size(Dataset2,1)
                K(i,j)=exp(-d(i,j)^2/(t*(dmax^2))); %（高斯核）
                K(j,i)=K(i,j);
                K(i,i)=1;
            end
         end
    %normalized    % scale to [0,1]
    for i = 1 : size(Dataset1,1)      
        for j=1:size(Dataset2,1)
            K(i,j)=(K(i,j)-min(K(:)))/(max(K(:))-min(K(:))); %（高斯核）
        end
    end
    num=num+1;
    allkernel(:,:,num)=K;
     save(['Ting/guassion-' num2str(t) '.mat'], 'K');
%     save(['Yan/guassion-' num2str(t) '.mat'], 'K');
    end  
    % one linear kernel
%     K=linear(Dataset1,Dataset2);
    for i = 1 : size(Dataset1,1)
        for j = 1 : size(Dataset2,1)
            K(i,j)=Dataset1(i,:)*Dataset2(j,:)';
        end 
    end
    %normalized
    for i = 1 : size(Dataset1,1)      
        for j=1:size(Dataset2,1)
            K(i,j)=(K(i,j)-min(K(:)))/(max(K(:))-min(K(:))); 
        end
    end
    num=num+1;
    allkernel(:,:,num)=K;
     save('Ting/kernel-linear.mat', 'K');
%     save('Yan/kernel-linear.mat', 'K');
    % four polynomial kernels
    for a=[0,1]
        for b=[2,4]
        for i = 1 : size(Dataset1,1)
            for j = 1 : size(Dataset2,1)
                K(i,j)=(a+(Dataset1(i,:)*Dataset2(j,:)'))^b;
            end
        end
        for i = 1 : size(Dataset1,1)      
            for j=1:size(Dataset2,1)
                K(i,j)=(K(i,j)-min(K(:)))/(max(K(:))-min(K(:)));
            end
        end
        num=num+1;
        allkernel(:,:,num)=K;
         save(['Ting/kernel-polynomial-a' num2str(a) '-b' num2str(b) '.mat'], 'K'); 
%         save(['Yan/kernel-polynomial-a' num2str(a) '-b' num2str(b) '.mat'], 'K'); 
        end 
    end
    save(['Ting/allkernel.mat'], 'allkernel');


clear
fileFolder=fullfile('data');%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%change
dirOutput=dir(fullfile(fileFolder));
fileNames={dirOutput.name}';
w=1;
m=length(fileNames);
C1=cell(3*m,1);
j=1;
for i=3:length(fileNames)
    eval(['dataset{i-2}','=load(fileNames{i})']);
    
%     mat22Arff( dataset{j} ,['aaa',fileNames{i},'.arff']);
     [C,gt]=cluster_jl(dataset{j},0,1,1,1); %高斯核计算邻接矩阵时
%   [C,gt]=cluster_jl(dataset{j},0,1,1,1);
     [A,nmi(j),avgent] = compute_nmi(gt,C);
     [AR,RI(j),MI,HI,A]=RandIndex(gt,C);
     [f(j),p,r] = compute_f(gt,C);
     [ARI(j)]=rand_index(gt',C', 'adjusted')
	 j=j+1;
     C1{w,1} = fileNames{i};
     w=w+1;
     C1{w,1}=gt';
     w=w+1;
     C1{w,1}=C';
     w=w+1;
end
cell2csv('repeat(3)_Greedy.csv', C1, ',') %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%change
% result=[RI',nmi',f',ARI'];
% xlswrite(['Yan221_Greedy_result' '.xlsx'], result)
% xlswrite(['test_data_S_k_result_ou' '.xlsx'], result)


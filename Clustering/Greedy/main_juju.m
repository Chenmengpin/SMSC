result=[];
% Dataset{1}=Biaseexpression;
Dataset{1}=Yanexpression;
Dataset{2}=Dengexpression;
Dataset{3}=Goolamexpression;
% Dataset{5}=Kolodziejczykexpression;
Dataset{4}=Pollenexpression;
Dataset{5}=Treutleinexpression;
Dataset{6}=Patelexpression;
Dataset{7}=Usoskinexpression;
Dataset{8}=Tingexpression;
for j=1:8
[pred_y,y]=cluster_jl(Dataset{j},0,1,1,1);
a = ClusteringMeasure_new(y, pred_y);
  result=[result; a];
end
xlswrite(['Greedy_result' '.xlsx'], result)
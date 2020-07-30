label1={'1000','2000','3000','5000','10000'};
label2={'0.01','0.05','0.1'}
Z=[80.78,80.78,80.78,80.78,80.78;
84.05,80.78,75.90,81.78,81.78;
79.85,79.85,79.85,79.85,79.85];

hb=bar3(Z);
% renderCDataByHeight(hb, false);
% colorbar;
set(gca, 'xticklabel', label1);
set(gca, 'yticklabel', label2);
view([-30, 30])
for i = 1:size(Z,1)
for j = 1:size(Z,2)
text(j, i,Z(i,j)+5,  num2str(Z(i,j)));
end
end
 title('(1) alpha=1e-2','position',[3.5,1,-132]);
 %title( '(1) alpha=1e-3', 'positon',[23,-4]);    %#标题
x1=xlabel('beta');        %#x轴标题
x2=ylabel('gamma');       % #y轴标题
x3=zlabel('ARI');        %#z轴标题
set(x1,'Rotation',30);    %#x轴名称旋转
set(x2,'Rotation',-30);    %#y轴名称旋转
% pause(1);
% renderCDataByHeight(hb, true);
% pause(1);
% renderCDataByHeight(hb, true);
% colormap spring;
% 
% function renderCDataByHeight(hb, interp)
% % hb为bar3返回的三维柱状图句柄,
% % 对hb的各柱子按高度渲染CData属性，
% % interp指定是否渐变(默认为false)
% % interp==true:每个柱子从下到上颜色渐变
% % interp==false:每个柱子一种颜色
% % hb中句柄个数等于数据列数,hb(j)为第j列数据的句柄
% % if nargin == 1
% %     % interp默认值
% %     interp=false;
% % end
% % if interp == true
% %     %每个柱子从下到上颜色渐变
% %     shading interp;
% %     for j = 1 : length(hb)
% %         % 用Zdata属性去填充Cdata属性
% %         zdata = get(hb(j), 'Zdata');
% %         set(hb(j), 'Cdata', zdata);
% %         % 设置边线颜色
% %         set(hb, 'EdgeColor', [0.5 0.5 0.5]);
% %     end
% % else
%     % 每个柱子一种颜色
%     for j = 1:length(hb)
%         % 设置hb(j)的Cdata属性
%         % 制作CData新值cdata用以替换其旧值
%         % cdata将在ZData的基础上修改而成
%         cdata = get(hb(j), 'ZData');
%         % cdata行数除以6就是数据行数
%         m = size(cdata,1)/6;
%         % 填充cdata
%         for i = 1:m
%             % 设置cdata中(i,j)数据对应的6行
%             % 将这6行的值均填充(i,j)数据的值
%             vij = cdata((i-1)*6+2,2);%可由cdata(ZData)中获得(i,j)数据的值
%             cdata((i-1)*6+1:(i-1)*6+6,:) = vij;%(i,j)数据对应的6行填充完毕
%         end
%         set(hb(j), 'Cdata', cdata);%将cdata赋给Cdata属性
%     end
% end
% % end
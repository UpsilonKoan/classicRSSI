%%ASBG��Կ�����㷨
%%���������a�������Ż�����,Block_size�������С,RSSA,RSSB���ŵ��������У�Alcie��Bob�ˣ�
%%�������Կ���ش�

function [KA_initial,KB_initial]=ABSG(a,Block_size,RSSA,RSSB)
  k1=1;
  k2=1;
for i=1:floor(length(RSSA)/Block_size)
     %%%%%%%%%%%%%%%%%����%%%%%%%%%%%%%%%
    for j=1:Block_size
       A_temp(j)=RSSA((i-1)*Block_size+j);
       B_temp(j)=RSSB((i-1)*Block_size+j);
    end
    %%%%%%%%%%%%%%%%%%%%%%������ƽ%%%%%%%%%%%%%%%%%%%%
     q_p=mean(A_temp)+a*std(A_temp);
     q_n=mean(A_temp)-a*std(A_temp);
    %%%%%%%%%%%%%%%%�������˫��ƽ����%%%%%%%%%%%%%%%%%
    for j=1:Block_size
        if(A_temp(j)>=q_p)
         KA_temp(j+(i-1)*Block_size)=1;
          A_index(k1)=j+(i-1)*Block_size;
          k1=k1+1;
           elseif(A_temp(j)<=q_n)
           KA_temp(j+(i-1)*Block_size)=0;
            A_index(k1)=j+(i-1)*Block_size;  
          k1=k1+1;
          else
             KA_temp(j+(i-1)*Block_size)=2;
        end
    end
    
    q_p=mean(B_temp)+a*std(B_temp);
    q_n=mean(B_temp)-a*std(B_temp);
     for j=1:Block_size
        if(B_temp(j)>=q_p)
           KB_temp(j+(i-1)*Block_size)=1;
          B_index(k2)=j+(i-1)*Block_size;
          k2=k2+1;
            elseif(B_temp(j)<=q_n)
          KB_temp(j+(i-1)*Block_size)=0;
          B_index(k2)=j+(i-1)*Block_size;  
          k2=k2+1;
          else
             KB_temp(j+(i-1)*Block_size)=2;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  k3=1;
  for i=1:k1-1
      for j=1:k2-1
          if(A_index(i)==B_index(j))
              index(k3)=B_index(j);
              k3=k3+1;
          end
      end
  end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  for i=1:k3-1
      KA_initial(i)=KA_temp(index(i));
      KB_initial(i)=KB_temp(index(i));
  end 





%%%%%%%%%%%%%%%In this program fusion of palm print and palm vein is
%%%%%%%%%%%%%%%performed is performed on datasets of 500 candidate
%%%%%%%%%%%%%%%four image is taken for training purpose and 2 for testing
%%%%%%%%%%%%%%%purpose
%%%%%feture extractio is taken by storing the standard deviation of
%%%%%selected block (after calculting DCT of image)as a feature vector
%%%%%%Single image is converted into vector of 1*39 only%%%%%%%
clc;
clear all;
close all;
%loading the file created for testing and traing of palmprint and palm vein
no_im=500*4;
tr_im=500*2;
%%%%%%%opening files of palm vein
fi = fopen('C:\Users\ADITYA\Desktop\ROI\features_palmvien_1000.txt');
for i=1:38
    for j=1:no_im 
Fe_1(j,i)= fscanf(fi,'%f',1);
    end
end
fclose(fi);%Now close the file.

fit = fopen('C:\Users\ADITYA\Desktop\ROI\features_palmvien_1000_test.txt');
for i=1:38
    for j=1:tr_im 
Fea_1(j,i)= fscanf(fit,'%f',1);
    end
end
fclose(fit);%Now close the file.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%palm-vien done%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%opening files of palm print%%%%%%%%%%%%%%%%%%%
%%this text file is also present inside the source folder hence location can be changed  
fif = fopen('C:\Users\ADITYA\Desktop\ROI\features_palmprint_1000.txt');
for i=1:38
    for j=1:no_im
Fe_2(j,i)= fscanf(fif,'%f',1);
    end
end
fclose(fif);%Now close the file.

fiif = fopen('C:\Users\ADITYA\Desktop\ROI\features_palmprint_1000_test.txt');
for i=1:38
    for j=1:tr_im
Fea_2(j,i)= fscanf(fiif,'%f',1);
    end
end
fclose(fiif);%Now close the file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%fusing%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic;

fea=zeros(1000,76);
fe=zeros(2000,76);
%%%%%%combing both the feature vector of palm print and palm vein
for i=1:no_im
    for j=1:38
        fe(i,j)=Fe_1(i,j);
    end
end
for i=1:tr_im
    for j=1:38
        fea(i,j)=Fea_1(i,j);
    end
end
for i=1:no_im
    for j=39:76
        fe(i,j)=Fe_2(i,j-38);
    end
end
for i=1:tr_im
    for j=39:76
        fea(i,j)=Fea_2(i,j-38);
    end
end


%%%%%Calculating distance between testing and training feature vector
for i=1:no_im
    
    for k=1:tr_im
        sum=0; 
        for j=1:76 
            %score=abs(fea(k,j)-fe(i,j)); %Manhatten
            %score=(sqrt(fea(k,j))-sqrt(fe(i,j))^2);%heillenger
         score=((abs(fea(k,j)-fe(i,j)))/(abs(fea(k,j))+abs(fe(i,j))));    %canbera
         %score=((fea(k,j)-fe(i,j))^2);%%euclidean
         sum=sum+score;
        end
        
        %sum=sum/2;      %heinder
        %dis(i,k)=sqrt(sum);%%euclidean and heinder
        dis(i,k)=sum;%Manhatten and %canbera 
    %dis(i,k)=sqrt(sum); 
    end
end
th=10.5;
%%%%%%Depending upon the results of distancces template is given
for k=1:tr_im
    min(k)=dis(1,k);
for i=1:no_im
        
        if ((dis(i,k)<min(k))&&(dis(i,k)<th))
        min(k)=dis(i,k);
        win_img_i(k)=i;
        %no_win=k;
        end
end
    %win_f(k)=win_img(i);
    %min_f(k)=min(i);
end
toc;

%%%%%%%% CHARACTER RECOGNITION USING BACK PROPAGATION ALGORITHM %%%%%%%%%

%%%%%%%%%%%%%%% Code Starts%%%%%%%%%%%%%%%%%%%
clear all;clc;

i1=imresize((edu_imgcrop(imread('1.bmp'))),[50 50]);

i2=imresize((edu_imgcrop(imread('2.bmp'))),[50 50]);

i3=imresize((edu_imgcrop(imread('3.bmp'))),[50 50]);

i4=imresize((edu_imgcrop(imread('4.bmp'))),[50 50]);

i5=imresize((edu_imgcrop(imread('5.bmp'))),[50 50]);

i6=imresize((edu_imgcrop(imread('6.bmp'))),[50 50]);

i7=imresize((edu_imgcrop(imread('7.bmp'))),[50 50]);

i8=imresize((edu_imgcrop(imread('8.bmp'))),[50 50]);

i9=imresize((edu_imgcrop(imread('9.bmp'))),[50 50]);

i10=imresize((edu_imgcrop(imread('10.bmp'))),[50 50]);

i11=imresize((edu_imgcrop(imread('11.bmp'))),[50 50]);

i12=imresize((edu_imgcrop(imread('12.bmp'))),[50 50]);

i13=imresize((edu_imgcrop(imread('13.bmp'))),[50 50]);

i14=imresize((edu_imgcrop(imread('14.bmp'))),[50 50]);

i15=imresize((edu_imgcrop(imread('15.bmp'))),[50 50]);

i16=imresize((edu_imgcrop(imread('16.bmp'))),[50 50]);

i17=imresize((edu_imgcrop(imread('17.bmp'))),[50 50]);

i18=imresize((edu_imgcrop(imread('18.bmp'))),[50 50]);

i19=imresize((edu_imgcrop(imread('19.bmp'))),[50 50]);

i20=imresize((edu_imgcrop(imread('20.bmp'))),[50 50]);

i21=imresize((edu_imgcrop(imread('21.bmp'))),[50 50]);

i22=imresize((edu_imgcrop(imread('22.bmp'))),[50 50]);

i23=imresize((edu_imgcrop(imread('23.bmp'))),[50 50]);

i24=imresize((edu_imgcrop(imread('24.bmp'))),[50 50]);

i25=imresize((edu_imgcrop(imread('25.bmp'))),[50 50]);

i26=imresize((edu_imgcrop(imread('26.bmp'))),[50 50]);

i27=imresize((edu_imgcrop(imread('27.bmp'))),[50 50]);

i28=imresize((edu_imgcrop(imread('28.bmp'))),[50 50]);

i29=imresize((edu_imgcrop(imread('29.bmp'))),[50 50]);

i30=imresize((edu_imgcrop(imread('30.bmp'))),[50 50]);

i31=imresize((edu_imgcrop(imread('31.bmp'))),[50 50]);

i32=imresize((edu_imgcrop(imread('32.bmp'))),[50 50]);

i33=imresize((edu_imgcrop(imread('33.bmp'))),[50 50]);

i34=imresize((edu_imgcrop(imread('34.bmp'))),[50 50]);

i35=imresize((edu_imgcrop(imread('35.bmp'))),[50 50]);

i36=imresize((edu_imgcrop(imread('36.bmp'))),[50 50]);

i37=imresize((edu_imgcrop(imread('37.bmp'))),[50 50]);




s1=[]
for i=1:50
    for j=1:50
        s1=[s1;i1(i,j)];
    end
end

s2=[]
for i=1:50
    for j=1:50
        s2=[s2;i2(i,j)];
    end
end

s3=[]
for i=1:50
    for j=1:50
        s3=[s3;i3(i,j)];
    end
end

s4=[]
for i=1:50
    for j=1:50
        s4=[s4;i4(i,j)];
    end
end

s5=[]
for i=1:50
    for j=1:50
        s5=[s5;i5(i,j)];
    end
end

s6=[]
for i=1:50
    for j=1:50
        s6=[s6;i6(i,j)];
    end
end

s7=[]
for i=1:50
    for j=1:50
        s7=[s7;i7(i,j)];
    end
end

s8=[]
for i=1:50
    for j=1:50
        s8=[s8;i8(i,j)];
    end
end

s9=[]
for i=1:50
    for j=1:50
        s9=[s9;i9(i,j)];
    end
end

s10=[]
for i=1:50
    for j=1:50
        s10=[s10;i10(i,j)];
    end
end
s11=[]
for i=1:50
    for j=1:50
        s11=[s11;i11(i,j)];
    end
end
s12=[]
for i=1:50
    for j=1:50
        s12=[s12;i12(i,j)];
    end
end
s13=[]
for i=1:50
    for j=1:50
        s13=[s13;i13(i,j)];
    end
end
s14=[]
for i=1:50
    for j=1:50
        s14=[s14;i14(i,j)];
    end
end
s15=[]
for i=1:50
    for j=1:50
        s15=[s15;i15(i,j)];
    end
end
s16=[]
for i=1:50
    for j=1:50
        s16=[s16;i16(i,j)];
    end
end
s17=[]
for i=1:50
    for j=1:50
        s17=[s17;i17(i,j)];
    end
end
s18=[]
for i=1:50
    for j=1:50
        s18=[s18;i18(i,j)];
    end
end
s12=[]
for i=1:50
    for j=1:50
        s12=[s12;i12(i,j)];
    end
end
s19=[]
for i=1:50
    for j=1:50
        s19=[s19;i19(i,j)];
    end
end
s20=[]
for i=1:50
    for j=1:50
        s20=[s20;i20(i,j)];
    end
end
s21=[]
for i=1:50
    for j=1:50
        s21=[s21;i21(i,j)];
    end
end
s22=[]
for i=1:50
    for j=1:50
        s22=[s22;i22(i,j)];
    end
end
s23=[]
for i=1:50
    for j=1:50
        s23=[s23;i23(i,j)];
    end
end
s24=[]
for i=1:50
    for j=1:50
        s24=[s24;i24(i,j)];
    end
end
s25=[]
for i=1:50
    for j=1:50
       s25=[s25;i25(i,j)];
    end
end
s26=[]
for i=1:50
    for j=1:50
        s26=[s26;i26(i,j)];
    end
end
s27=[]
for i=1:50
    for j=1:50
        s27=[s27;i27(i,j)];
    end
end
s28=[]
for i=1:50
    for j=1:50
       s28=[s28;i28(i,j)];
    end
end
s29=[]
for i=1:50
    for j=1:50
       s29=[s29;i29(i,j)];
    end
end
s30=[]
for i=1:50
    for j=1:50
       s30=[s30;i30(i,j)];
    end
end
s31=[]
for i=1:50
    for j=1:50
       s31=[s31;i31(i,j)];
    end
end
s32=[]
for i=1:50
    for j=1:50
       s32=[s32;i32(i,j)];
    end
end
s33=[]
for i=1:50
    for j=1:50
       s33=[s33;i33(i,j)];
    end
end
s34=[]
for i=1:50
    for j=1:50
       s34=[s34;i34(i,j)];
    end
end
s35=[]
for i=1:50
    for j=1:50
       s35=[s35;i35(i,j)];
    end
end
s36=[]
for i=1:50
    for j=1:50
       s36=[s36;i36(i,j)];
    end
end
s37=[]
for i=1:50
    for j=1:50
       s37=[s37;i37(i,j)];
    end
end
%s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37
le=[s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27,s28,s29,s30,s31,s32,s33,s34,s35,s36,s37];
t=eye(37);
%net=newff(minmax(le),[40,20],{'tansig','purelin'},'traingd');
%net.trainParam.epochs = 10000;
%net.performFcn='msereg'; net.performParam.ratio=0.5; 
%net.trainParam.goal=0.001;
%net.trainParam.mem_reduc=2;  
%net.trainParam.lr=0.01;
%net.trainParam.mc=0.1
%net = train(net,le,t);
%Y = sim(net,le);
net = newff(minmax(le),[40 37],{'logsig' 'logsig'},'traingdx');
net.LW{2,1} = net.LW{2,1}*0.01;
net.b{2} = net.b{2}*0.01;
net.performFcn = 'sse';         
net.trainParam.goal = 0.001;    
net.trainParam.show = 20;      
net.trainParam.epochs = 10000;  
net.trainParam.mc = 0.95;  
net.trainParam.mc=0.1
net = train(net,le,t);
Y = sim(net,le);
cor=0;
for i=1:37
    max=1;
    for j=1:37
        if Y(j,i)>Y(max,i)
            max=i;
        end
    end
    if max==i
        cor=cor+1;
    end
end

'Train Cases Recognized'
cor

'Train Cases Recognition Accuracy'
cor/10*100

% Test Image
a=imresize((edu_imgcrop(imread('7.bmp'))),[50 50]);

a1=[];
for i=1:50
    for j=1:50
        a1=[a1;a(i,j)];
    end
end
a2=sim(net,a1);

'Output vector for test image'
a2
max=1;
for j=1:37
    if a2(j)>a2(max)
        max=j;
        x=j;
    end
   
           
end

'test image output'
max

 if max==1      
 fid = fopen('1.txt', 'r');
    fclose(fid)
   winopen('1.txt')
 end

 if max==2     
 fid = fopen('2.txt', 'r');
    fclose(fid)
   winopen('2.txt')
 end

 if max==3      
 fid = fopen('3.txt', 'r');
    fclose(fid)
   winopen('3.txt')
 end

 if max==4     
 fid = fopen('4.txt', 'r');
    fclose(fid)
   winopen('4.txt')
 end

 if max==5     
 fid = fopen('5.txt', 'r');
    fclose(fid)
   winopen('5.txt')
 end

 if max==6      
 fid = fopen('6.txt', 'r');
    fclose(fid)
   winopen('6.txt')
 end

 if max==7    
 fid = fopen('7.txt', 'r');
    fclose(fid)
   winopen('7.txt')
 end

 if max==8    
 fid = fopen('8.txt', 'r');
    fclose(fid)
   winopen('8.txt')
 end

 if max==9      
 fid = fopen('9.txt', 'r');
    fclose(fid)
   winopen('9.txt')
 end

 if max==10     
 fid = fopen('10.txt', 'r');
    fclose(fid)
   winopen('10.txt')
 end

 if max==11      
 fid = fopen('11.txt', 'r');
    fclose(fid)
   winopen('11.txt')
 end

 if max==12      
 fid = fopen('12.txt', 'r');
    fclose(fid)
   winopen('12.txt')
 end

 if max==13      
 fid = fopen('13.txt', 'r');
    fclose(fid)
   winopen('13.txt')
 end

 if max==14      
 fid = fopen('14.txt', 'r');
    fclose(fid)
   winopen('14.txt')
 end

 if max==15      
 fid = fopen('15.txt', 'r');
    fclose(fid)
   winopen('15.txt')
 end

 if max==16      
 fid = fopen('16.txt', 'r');
    fclose(fid)
   winopen('16.txt')
 end

 if max==17      
 fid = fopen('17.txt', 'r');
    fclose(fid)
   winopen('17.txt')
 end

 if max==18      
 fid = fopen('18.txt', 'r');
    fclose(fid)
   winopen('18.txt')
 end

 if max==19      
 fid = fopen('19.txt', 'r');
    fclose(fid)
   winopen('19.txt')
 end

 if max==20      
 fid = fopen('20.txt', 'r');
    fclose(fid)
   winopen('20.txt')
 end


 if max==21     
 fid = fopen('21.txt', 'r');
    fclose(fid)
   winopen('21.txt')
 end



 if max==22      
 fid = fopen('22.txt', 'r');
    fclose(fid)
   winopen('22.txt')
 end


 if max==23      
 fid = fopen('23.txt', 'r');
    fclose(fid)
   winopen('23.txt')
 end


 if max==24      
 fid = fopen('24.txt', 'r');
    fclose(fid)
   winopen('24.txt')
 end


 if max==25      
 fid = fopen('25.txt', 'r');
    fclose(fid)
   winopen('25.txt')
 end


 if max==26      
 fid = fopen('26.txt', 'r');
    fclose(fid)
   winopen('26.txt')
 end


 if max==27      
 fid = fopen('27.txt', 'r');
    fclose(fid)
   winopen('27.txt')
 end


 if max==28      
 fid = fopen('28.txt', 'r');
    fclose(fid)
   winopen('28.txt')
 end


 if max==29      
 fid = fopen('29.txt', 'r');
    fclose(fid)
   winopen('29.txt')
 end


 if max==30      
 fid = fopen('30.txt', 'r');
    fclose(fid)
   winopen('30.txt')
 end

 if max==31     
 fid = fopen('31.txt', 'r');
    fclose(fid)
   winopen('31.txt')
 end
 
 
 if max==32     
 fid = fopen('32.txt', 'r');
    fclose(fid)
   winopen('32.txt')
 end
 
 
 if max==33     
 fid = fopen('33.txt', 'r');
    fclose(fid)
   winopen('33.txt')
 end
 
 
 if max==34      
 fid = fopen('34.txt', 'r');
    fclose(fid)
   winopen('34.txt')
 end
 
 
 if max==35      
 fid = fopen('35.txt', 'r');
    fclose(fid)
   winopen('35.txt')
 end
 
 
 if max==36      
 fid = fopen('36.txt', 'r');
    fclose(fid)
   winopen('36.txt')
 end
 
 
 if max==37      
 fid = fopen('37.txt', 'r');
    fclose(fid)
   winopen('37.txt')
 end
 
 
 
 
 
 

       

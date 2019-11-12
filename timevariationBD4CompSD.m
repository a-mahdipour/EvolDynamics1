clear
clc
%tic

tmax=2000;
iteration=200000;

r1=1; rr1=1;
r= 1.1;
alpha= 1 ;
beta=1;
r2= alpha*r;
rr2= beta*r;
u1 = 0.5;
u2 = 0.7                                                       ;
eta1 = 0;
eta2 = 0.3;
Ns=10;
Nd=10;

var1=zeros(iteration,tmax);
var2=zeros(iteration,tmax);

for i=1:1:iteration
    i
    
    x=0;
    y=1;
    var1(i,1)=x;
    var2(i,1)=y;
            
    for t=1:1:tmax
        
         [XX,YY] =  BDMoran4CompSD(Ns,Nd,x,y,r1,r2,rr1,rr2,u1,u2,eta1,eta2);
        
        var1(i,t+1)=XX;
        var2(i,t+1)=YY;
                
%         tt=t;
%         if(XX==0 && YY==0 || XX==Ns &&  YY==Nd)
%           for ii=tt+1:1:tmax
%             var1(1,ii)=XX;
%             var2(1,ii)=YY;
%           end
%           t=tmax+1;
%         end

% tt=t;
%         if(XX==0 || XX==Ns )
%           for ii=tt+1:1:tmax
%             var1(1,ii)=XX;
%           end
%           t=tmax+1;
%         end
%         
%         
%         if(YY==0||YY==Nd)
%            for ii=tt+1:1:tmax
%             var2(1,ii)=YY;
%            end
%            t=tmax+1;
%         end
%              
        
        
        x = XX;
        y = YY;
       
       
    end
    
    
    
   
 end



  for kk=1:tmax
     Var1(1,kk) = (1/Ns)* (1/iteration)*sum(var1(:,kk));
     Var2(1,kk) = (1/Nd)* (1/iteration)*sum(var2(:,kk));
%      Var3(1,kk) = 1-Var1(1,kk);
%      Var4(1,kk) = 1-Var2(1,kk);
%      
  end

% (1-(uu/(1-uu)))/(1-(uu/(1-uu))^N)
% Var1(1,:) =(1/N)* (1/iteration)*sum(var1,1);
% Var2(1,:) =(1/N)*(1/iteration)*sum(var2,1);

% for ttt=1:tmax
%     if(abs(var1(1,ttt)-var(1,tmax)) < 0.0000001)
%         TTT = 0.02*tmax+ttt
%     break    
%         
%     end
% end

Var1(1,tmax)
Var2(1,tmax)

for jj=1:tmax
qq(1,jj)= jj-1;
end

hold on

figure(2) 
plot(qq,Var1,'r','LineWidth',2);
xlabel('Time'); ylabel('Number of Mutant Stem/Progenitor/Differentited Cells')

figure(2) 
plot(qq,Var2,'y','LineWidth',2);
xlabel('Time'); ylabel('Number of Mutant Stem/Progenitor/Differentited Cells')


% figure(1) 
% plot(qq,Var2,'b','LineWidth',2);
% xlabel('Time'); ylabel('Number of Mutant Stem/Progenitor/Differentited cells')
% 
% figure(1) 
% plot(qq,Var4,'k','LineWidth',2);
% xlabel('Time'); ylabel('Number of Mutant Stem/Progenitor/Differentited cells')
% title('4-Compartment BD Model,r_1= r^~_1=1, r_2=1.5,r^~_2=1,u_1 = 0.5,u_2 = 0.2,\eta_1 = \eta_2 = 0.01,N_S=10,N_D=100')



% figure(1) 
% plot(qq,Var3,'g','LineWidth',2);
% xlabel('Time'); ylabel('Number of Stem/Progenitor/Differentited cells')

%toc
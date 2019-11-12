

#######################################################
###    Analytic calculation of Fixation Probablity  ###
###               in 4-compartment model            ### 
###    University of Waterloo, Waterloo,Canada      ###
###            copyright@AliMahdipour               ###
#######################################################


clear
clc
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
         %[XX,YY] =  Moran4BDCompSD(Ns,Nd,x,y,r1,r2,rr1,rr2,u1,u2,eta1,eta2);
         
        var1(i,t+1)=XX;
        var2(i,t+1)=YY;
        x = XX;
        y = YY;
    
    end
 
 end



  for kk=1:tmax
     Var1(1,kk) = (1/Ns)* (1/iteration)*sum(var1(:,kk));
     Var2(1,kk) = (1/Nd)* (1/iteration)*sum(var2(:,kk));
  end

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


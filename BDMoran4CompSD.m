
#######################################################
###      4-compartment model (Birth-Death)          ###
###   University of Waterloo, Waterloo,Canada       ###
###            copyright@AliMahdipour               ###
#######################################################

function [XX,YY] = BDMoran4CompSD(Ns,Nd,x,y,r1,r2,rr1,rr2,u1,u2,eta1,eta2) 
b1 = rand;
d1 = rand;
m1 = rand;
if( b1 <= (r2*x)/(r2*x + r1*(Ns-x) + rr2*y + rr1*(Nd-y) ) )
    if( m1 <= 1-u2 )
        if( d1 <= (Ns-x)/Ns )
            x=x+1;
        end
    elseif( m1 > 1-u2 )
        
        if( d1 <= (Nd-y)/Nd  )
            y=y+1;
        end
    end
         
elseif( (r2*x)/(r2*x + r1*(Ns-x) + rr2*y + rr1*(Nd-y)) < b1 && b1 <= (r2*x + r1*(Ns-x))/(r2*x + r1*(Ns-x) + rr2*y + rr1*(Nd-y))  ) 
    if( m1 <= 1-u1 )
        if(   (Ns-x)/Ns < d1  )
            x=x-1;
        end
    elseif( m1 > 1-u1 )
        
        if( (Nd-y)/Nd < d1  )
            y=y-1;
        end
    end
    
elseif( (r2*x + r1*(Ns-x))/(r2*x + r1*(Ns-x) + rr2*y + rr1*(Nd-y)) < b1 && b1 <= (r2*x + r1*(Ns-x)+ rr2*y)/(r2*x + r1*(Ns-x) + rr2*y + rr1*(Nd-y))  )
    if( m1 <= 1-eta2)
        if(  d1 <= (Nd-y)/Nd  )
             y=y+1;
         end
    elseif( m1 > 1-eta2)
        
         if(  d1 <= (Ns-x)/Ns  )
             x=x+1;
         end
     end
        
elseif( (r2*x + r1*(Ns-x)+ rr2*y)/(r2*x + r1*(Ns-x) + rr2*y + rr1*(Nd-y)) < b1  )
    if( m1 <= 1-eta1 )
        if(  (Nd-y)/Nd < d1 )
            y=y-1;
        end
    elseif( m1 > 1-eta1 )
        
        if(  (Ns-x)/Ns < d1 )
            x=x-1;
        end
    end
     
end

XX=x;
YY=y;

end


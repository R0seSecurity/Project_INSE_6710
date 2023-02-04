%initializing the variables

%variables to calculate the average for 50 trails
falarmavg =0;
drateavg =0;
jdavg = 0;
jwavg = 0;
jeeavg = 0;


for i = 1:50
    sim('project_model_lqi_Matlab2019');
    %variables to calculate control performance loss
    jnum = 0;
    dnum = 0;
  %variables to calculate the falarm
    fnuminator =0;
    fdenominator =0;
    
    %variables to calculate the drate
    dnuminator=0;
    ddenominator=0;
    
    
    for t = 0:0.5:300
        if ((t >= 200 && t < 250) && (attack(t*2+1) == 1))
             fnuminator =  fnuminator+1;
        elseif((t >= 300 && t < 500) && (attack(t*2+1) == 1))
            fnuminator =   fnuminator +1;
            
        else
            fnuminator  =  fnuminator +0;
        end
        
        
        
         if (t >= 200 && t < 250)
            fdenominator =fdenominator+1;
            
        elseif (t >= 300 && t < 500)
            fdenominator =fdenominator+1;
        else
            fdenominator = fdenominator+0;
            
        end
        
        
        if (t >= 250 && t<300) && (attack(t*2+1) == 1)
            dnuminator =   dnuminator+1;
        else
            dnuminator =   dnuminator+0;
        end
        
        
        
        if t >= 250 && t < 300
            ddenominator =    ddenominator+1;
        else
            ddenominator =  ddenominator+0;
            
        end
        
      % to findout the referencesignal  
        
        find = y(t*2+1)-referencesignal(t*2+1);
        n =  norm(find,2);
        
        if t>=200 && t<250
            jnum =jnum + n;
            
        elseif t>=300 && t<500
            jnum =jnum + n;  
            
        else
            jnum = jnum+0;
        end
        
        
        if t>=200 && t<300
            dnum = dnum+1;
            
         elseif t>=300 && t<500
            dnum =dnum + 1;  
            
        else
            dnum = dnum+0;
        end
        
        
        
        
        
        
        
        
    end
    
      %single iteration FALARMRATE
    falarm = (  fnuminator/fdenominator)*100;
    
         %single iteration  DRATE
    drate = (dnuminator/ddenominator)*100;
    
      %single iteration DETECTOR PERFORMANCE
    jd = drate+(100-falarm);
    
      %single iteration CONTROL PERFORMANCE LOSS
    jee = jnum/dnum;
    
    jw = (100-drate)/100+jee;
    
    
    
       % adding the results
    falarmavg =     falarmavg+falarm;
    drateavg = drateavg + drate;
    jdavg = jdavg+jd;
    jwavg = jwavg+jw;
    jeeavg = jeeavg+jee;
    
    
end


% CALCULATING THE AVERAGE RESULT OF 50 TRAILS
disp('Average Result of different values over 50 trails');
falarm_average_50trails = falarmavg/50

drate_average_50trails_0to300 = drateavg/50

jd_detector_performance_average_50trails_ = jdavg/50

jw_average_50trails_200to300 = jwavg/50

jee_control_performance_average_50trails_200to300 = jeeavg/50





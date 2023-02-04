%initializing the variables

%variables to calculate the average for 50 trails
falarmavg =0;
drateavg =0;
jdavg = 0;

for i = 1:50
    sim('project_model_lqi_Matlab2017');
    
    
    %variables to calculate the falarm
    fnuminator =0;
    fdenominator =0;
    
    %variables to calculate the drate
    dnuminator=0;
    ddenominator=0;
    
    
    for t = 0:0.5:450
        
        if (t >= 0 && t < 50) && (anomaly(t*2+1) == 1)
            
            fnuminator =   fnuminator +1;
            
        elseif t>=450 && (anomaly(t*2+1) == 1)
             fnuminator =   fnuminator +1;
            
        else
            fnuminator  =   fnuminator +0;
        end
        
        
        
        if (t >= 0 && t < 50)
            fdenominator =fdenominator+1;
        elseif (t >= 450)
            fdenominator =fdenominator+1;
        else
            fdenominator= fdenominator+0;
        end
        
        
        
        if ((t >= 50 && t<450) && (anomaly(t*2+1) == 1))
            
            dnuminator =dnuminator+1;
        else
            dnuminator = dnuminator+0;
        end
        
        
        
        
        if (t >= 50 && t < 450)
            ddenominator = ddenominator+1;
        else
            ddenominator = ddenominator+0;
        end
        
    end
    %single iteration FALARMRATE
    falarm = (  fnuminator /fdenominator)*100;
    
    %single iteration  DRATE
    drate = ( dnuminator/ddenominator)*100;
    
    %single iteration DETECTOR PERFORMANCE
    jd = drate+(100-falarm);
    
    
    % adding the results
    falarmavg =     falarmavg+falarm;
    drateavg =       drateavg + drate;
    jdavg =          jdavg+jd;
    
    
end

% CALCULATING THE AVERAGE RESULT OF 50 TRAILS
disp('Average Result of different values over 50 trails for(0,450)');
falarm_average_50trails = falarmavg/50

drate_average_50trails = drateavg/50

jd_average_50trails = jdavg/50












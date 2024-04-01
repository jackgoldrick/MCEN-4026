import SixSigma.*
h_data = load('../data/height_data.mat');
d_data = load('../data/dial_data.mat');

% 1 is height data and 2 is dial data
data_set = [SixSigma(table2array(h_data.Height_Data), .995, 1.02) SixSigma(table2array(d_data.Dial_data), .995, 1.02)];

names = [ "Height Data" "Dial Data"];


for i=1:2
    data_set(i).charts = figure('Name',names(i));
    hold on
    tiledlayout(2,1)
    

    % Top plot
    mn = min(data_set(i).xbar_line);
    mx = max(data_set(i).xbar_line);
    ax1 = nexttile;
    hold on
    title(ax1,'X-Bar')
    ylabel(ax1,'AVG')
    xlabel(ax1, "Measurment Number")
    if (mx > data_set(i).x_UCL && mn < data_set(i).x_LCL)
       
        ylim (ax1, [mn - .005, mx + .005])

    elseif mx > data_set(i).x_UCL
        ylim (ax1, [data_set(i).x_LCL - .005, mx + .005])
        
    elseif mn < data_set(i).x_LCL

        ylim (ax1, [mn- .005, data_set(i).x_UCL + .005])

    else 
        ylim (ax1, [data_set(i).x_LCL - .005, data_set(i).x_UCL + .005]);

    end 
    
    plot(ax1, data_set(i).xbar_line,'-b');
    plot(ax1, yline(data_set(i).x_barbar,'-.g', "AVG"));
    plot(ax1, yline(data_set(i).x_UCL, '--r', "UCL"));
    plot(ax1, yline(data_set(i).x_LCL, '--m', "LCL"));

    hold off


    % Bottom plot
    mn = min(data_set(i).r_line);
    mx = max(data_set(i).r_line);
    ax2 = nexttile;
    hold on
    title('Range')
    ylabel('Range of Set')
    xlabel("Measurment Number")
    if (mx > data_set(i).r_UCL && mn < data_set(i).r_LCL)
       
        ylim (ax2, [mn - .005, mx + .005])

    elseif mx > data_set(i).r_UCL
        ylim (ax2, [data_set(i).r_LCL - .005, mx + .005])
        
    elseif mn < data_set(i).r_LCL

        ylim (ax2, [mn - .005, data_set(i).r_UCL + .005])

    else 
        ylim (ax2,[data_set(i).r_LCL - .005, data_set(i).r_UCL + .005]);

    end 
    
    plot(ax2, data_set(i).r_line,'-b');
    plot(ax2, yline(data_set(i).r_bar,'-.g', "AVG"));
    plot(ax2, yline(data_set(i).r_UCL, '--r', "UCL"));
    plot(ax2, yline(data_set(i).r_LCL, '--m', "LCL"));
    hold off

    hold off




end
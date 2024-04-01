import SixSigma.*
load('HW4_machine_data.mat');
m = [SixSigma(machine_1);
     SixSigma(machine_2);
     SixSigma(machine_3);
     SixSigma(machine_4);
     SixSigma(machine_5);
     SixSigma(machine_6);
     SixSigma(machine_7);];


for i=1:7
    figure(i)
    hold on
    tiledlayout(2,1)
    

    % Top plot
    ax1 = nexttile;
    hold on
    title(ax1,'X-Bar')
    ylabel(ax1,'AVG')
    xlabel(ax1, "Measurment Number")
    ylim (ax1, [m(i).x_LCL - .000005, m(i).x_UCL + .000005]);
    plot(ax1, m(i).xbar_line,'-b');
    plot(ax1, yline(m(i).x_barbar,'-.g', "AVG"));
    plot(ax1, yline(m(i).x_UCL, '--r', "UCL"));
    plot(ax1, yline(m(i).x_LCL, '--m', "LCL"));

    hold off


    % Bottom plot
    ax2 = nexttile;
    hold on
    title('Range')
    ylabel('Range of Set')
    xlabel("Measurment Number")
    ylim (ax2,[m(i).r_LCL - .000005, m(i).r_UCL + .000005]);
    plot(ax2, m(i).r_line,'-b');
    plot(ax2, yline(m(i).r_bar,'-.g', "AVG"));
    plot(ax2, yline(m(i).r_UCL, '--r', "UCL"));
    plot(ax2, yline(m(i).r_LCL, '--m', "LCL"));
    hold off

    hold off

    




end
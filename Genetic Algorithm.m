clc, clear, close all
rng default
global initial_flag ;
%% Genetic Algotithm Optimization 15 iterations
initial_flag = 0;
options = optimoptions('ga','PlotFcn',{@gaplotbestf,@gaplotdistance});
for i=1:15
initial_flag = 0;
% ga for CEC function 6 ,D=2;
%[ga_x,ga_val,ga_exit_flag,ga_op] = ga(@(x)benchmark_func(x,12),2,options);
% ga for CEC function 6 ,D=10;
[ga_x,ga_val,ga_exit_flag,ga_op] = ga(@(x)benchmark_func(x,12),10,options);
% ga for CEC function 7 ,D=2;
%[ga_x,ga_val,ga_exit_flag,ga_op] = ga(@(x)benchmark_func(x,11),2,options);
% uga for CEC function 7 ,D=10;
%[ga_x,ga_val,ga_exit_flag,ga_op] = ga(@(x)benchmark_func(x,11),10,options);
ga_main_val(i) = ga_val;
ga_main_exit_flag(i) = ga_exit_flag;
ga_main_op(i) = ga_op;
% save visualizations to file
fname = sprintf('filename(%d).fig', i) ;
savefig(fname)
end
%% GA 15 iteration measures
ga_val_max = max(ga_main_val);
ga_val_min = min(ga_main_val);
ga_val_mean = mean(ga_main_val);
ga_val_std = std(ga_main_val);
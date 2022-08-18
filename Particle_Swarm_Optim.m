clc, clear, close all
rng default
global initial_flag ;
%% Particle Swarm Optimization 15 Iterations
options = optimoptions('particleswarm','PlotFcn',{@pswplotbestf});
%rng default
initial_flag = 0;
for i=1:15
    % D=2 for Function 6
    [sp_x,sp_val,sp_ex_flag,sp_op] = particleswarm(@(x)benchmark_func(x,12),2,[-100,-100],[-pi,pi],options);
    %  D=10 for Function 6
    %[sp_x,sp_val,sp_ex_flag,sp_op] = particleswarm(@(x)benchmark_func(x,12),10,[-100,-100],[-pi,pi],options)
    % D=2 for Function 7
    %[sp_x,sp_val,sp_ex_flag,sp_op] = particleswarm(@(x)benchmark_func(x,11),2,[-100,-100],[700,700],options);
    % D=10 for Function 7
    %[sp_x,sp_val,sp_ex_flag,sp_op] = particleswarm(@(x)benchmark_func(x,11),10,[-100,-100],[100,100],options);
    sp_main_x(i,:) = sp_x;
    sp_main_val(i) = sp_val;
    sp_main_op(i) = sp_op;
    % saving Plot
    fname = sprintf('filename(%d).fig', i) ;
    savefig(fname)
end
%% PS Calculations
sp_val_max = max(sp_main_val);
sp_val_min = min(sp_main_val);
sp_val_mean = mean(sp_main_val);
sp_val_std = std(sp_main_val);
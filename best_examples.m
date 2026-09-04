
best_ex = {'extra/b1_t1.csv', 'b1_t8_no_hair.csv', ...
                 'extra/b1_t10_no_hair.csv', ...
                 'b2_t4_hair.csv', ...
                 'b2_t7_no_hair.csv', ...
                 'b4_t5_hair.csv', ...
                 'b4_t6_no_hair.csv'};

for i = 1:length(best_ex)
    
    current_file = best_ex{i};
    
    opts = detectImportOptions(current_file);
    opts.VariableNamesLine = 23; % row containing var names
    opts.DataLines = [24 Inf];   % rows containing data
    
    data = readtable(current_file, opts);
    
    figure;
    plot(data.LiveGraphTable, data.Var2 * -1);
    
    title(current_file, 'Interpreter', 'none');
    xlabel('Sample Number');
    ylabel('Tracking Value');
end
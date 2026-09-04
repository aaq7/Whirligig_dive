% with hair
filename = 'extra/b1_t2.csv'; 

opts = detectImportOptions(filename);
opts.VariableNamesLine = 23; % row containing var names
opts.DataLines = [24 Inf];   % rows containing data

data = readtable(filename, opts);

figure;
plot(data.LiveGraphTable, data.Var2);
title('Hair')
xlabel('Sample Number');
ylabel('Tracking Value');


% without hair
filename = 'b2_t3_no_hair.csv'; 

opts = detectImportOptions(filename);
opts.VariableNamesLine = 23; % row containing var names
opts.DataLines = [24 Inf];   % rows containing data

data = readtable(filename, opts);

figure;
plot(data.LiveGraphTable, data.Var2);
title('No Hair')
xlabel('Sample Number');
ylabel('Tracking Value');

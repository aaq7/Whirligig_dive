% b1a centers
%penetration_points = [954, 1408, 1098, NaN, 749, 894, 961, 900, 820, 1148];

% b1b centers
%penetration_points = [747, 825, 948, 955, 849, 708, 891, 760, 830, 854];

% b2 centers
%penetration_points = [685, 663, 879, 1020, 919, 1010, 988, 819, 834, 715];

% b4 centers 
penetration_points = [845, 924, 846, 731, 827, 833, 816, 808, 778, 851];

figure;
hold on; 

x_axis = -100:100;

for i = 1:10
    center_pt = penetration_points(i);
    
    filename = sprintf('b4_t%d_no_hair.csv', i); 

    if isnan(center_pt)
        continue; 
    end
    
    opts = detectImportOptions(filename);
    data = readtable(filename, opts);
    
    sample_nums = data{:, 1};
    tracking_vals = data{:, 2};
    
    center_idx = find(sample_nums == center_pt, 1);
    
    start_idx = center_idx - 100;
    end_idx = center_idx + 100;
    
    y_vals = tracking_vals(start_idx:end_idx);
        
    % Center by subtracting the value at the center index
    y_center_val = tracking_vals(center_idx);
    y_vals_centered = y_vals - y_center_val;
    % y_vals_centered = y_vals;
        
    plot(x_axis, y_vals_centered, 'LineWidth', 1.5, 'DisplayName', sprintf('Trial %d', i));
end

title('Beetle 4 Penetrance Overlay');
xlabel('Sample Number');
ylabel('Tracking Value Offset (g)');
%legend('show', 'Location', 'best'); 
hold off;
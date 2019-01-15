function [place_cell_data] = extract_place_cell_informationSV(ms,behav);


for cell_i =1:ms.numNeurons;
    display(strcat('Processing cell: ', num2str(cell_i/ms.numNeurons*100), '%'));
    [place_cell_data] = msSpatialFiringGE( ms, behav, cell_i,  100, true);
    Stability(cell_i) = place_cell_data.PlaceFieldStability;
    MI(cell_i) = place_cell_data.PlaceFieldInformation;
    Cell_ID(cell_i) = place_cell_data.Cell_ID;
    %pause
end


%% Plot results
figure
subplot(2,1,1)
bar(Cell_ID,Stability);
title 'Place Field Stability'

subplot(2,1,2)
bar(Cell_ID,MI);
title 'MI'

%%

save('zMI.mat', 'MI');
save('stability.mat', 'Stability');
save('Cell_ID.mat', 'Cell_ID');

place_fields.cell_ID = Cell_ID;
place_fields.MI = MI; 
place_fields.stability = Stability;


end
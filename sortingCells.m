% FOR YOU JISOOOOOO
clear variables 
clear all 
clc

%Loads in your registered cells
matFile = dir(fullfile(pwd, '**','cellRegistered*'));
load(matFile.name); 

%loads in your stability array and MI array: 
% load('stability.mat');
% load('zMI.mat');
load('place_data.mat'); 

%Uses the place cell algorithm to find the place cells: 
% [place_cells, stab] = find_place_cells(Stability,  0.2);
% place_cells_wake = place_cells'; 


%initializing the arrays before sorting: 
wake_NONrem_rem = cell_registered_struct.cell_to_index_map;
NONrem = cell_registered_struct.cell_to_index_map(:,2);
rem = cell_registered_struct.cell_to_index_map(:,3);
wake = cell_registered_struct.cell_to_index_map(:,1);


%we are going to creat another column for place cells, and if there are
%place cells in each of the things below it will list which cells are

%Sorting algorithm:
%NONrem and Rem sorted array
count = 1; 
for i = 1:length(cell_registered_struct.cell_to_index_map(:,1))
    if NONrem(i,1)> 0 && rem(i,1)>0 && wake(i,1) ==0
        NONrem_rem(count,1) = NONrem(i,1);  
        NONrem_rem(count,2) = rem(i,1); 
        NONrem_rem(count,3) = 0; 
        count = count+1; 
    end     
end

sTable1 = array2table(NONrem_rem, ...
    'VariableNames',{'NONRem','Rem ','PlaceCells'});

%wake and NONrem sorted array
count = 1; 
for i = 1:length(cell_registered_struct.cell_to_index_map(:,1))
    if wake(i,1)> 0 && NONrem(i,1)>0 && rem(i,1)==0
        wake_NONrem(count,1) = wake(i,1);  
        wake_NONrem(count,2) = NONrem(i,1);  
        wake_NONrem(count,3) = 0; 
        count = count+1; 
    end     
end

t = length(wake_NONrem(:,1));
for i=1:t
    if place_data{1,wake_NONrem(i,1)}.IsPlaceCell ==1
        wake_NONrem(i,3) = 1; 
    end 
end 

sTable2 = array2table(wake_NONrem, ...
    'VariableNames', {'Wake' , 'NONRem ' ,'PlaceCells'} );

idx1 = find(wake_NONrem(:,3)==1); 
wake_NONrem_placeCells = wake_NONrem(idx1,:); 

sTable3 = array2table(wake_NONrem_placeCells, ...
    'VariableNames', {'Wake' , 'NONRem ' ,'PlaceCells'} );


%wake and Rem sorted array
count = 1; 
for i = 1:length(cell_registered_struct.cell_to_index_map(:,1))
    if wake(i,1)> 0 && rem(i,1)>0 && NONrem(i,1)==0
        wake_rem(count,1) = wake(i,1);  
        wake_rem(count,2) = rem(i,1); 
        wake_rem(count,3) = 0; 
        count = count+1; 
    end     
end


t = length(wake_rem(:,1)); 
for i=1:t
    if place_data{1,wake_rem(i,1)}.IsPlaceCell ==1
        wake_rem(i,3) = 1; 
    end 
end 


sTable4 = array2table(wake_rem, ...
    'VariableNames', {'Wake' , 'Rem ','PlaceCells' } );


idx2 = find(wake_rem(:,3)==1); 
wake_rem_placeCells = wake_rem(idx2,:); 

sTable5 = array2table(wake_rem_placeCells, ...
    'VariableNames', {'Wake' , 'Rem ','PlaceCells'} );


%wake, rem, and NONrem sorted array: 
count = 1; 
for i = 1:length(cell_registered_struct.cell_to_index_map(:,1))
    if wake(i,1)> 0 && rem(i,1)>0 && NONrem(i,1)>0 
        wake_rem_NONrem(count,1) = wake(i,1);  
        wake_rem_NONrem(count,2) = rem(i,1);
        wake_rem_NONrem(count,3) = NONrem(i,1);
        wake_rem_NONrem(count,4) = 0; 
        count = count+1; 
    end     
end


count =1;
while count < length(wake_rem_NONrem(:,1))
    count = count+1;     
end 

for i=1:count
    if place_data{1,wake_rem_NONrem(i,1)}.IsPlaceCell ==1
        wake_rem_NONrem(i,4) = 1; 
    end 
end 

sTable6 = array2table(wake_rem_NONrem, ...
    'VariableNames', {'Wake' , 'Rem ', 'NONRem' ,'PlaceCells'} );


idx3 = find(wake_rem_NONrem(:,4)==1); 
wake_rem_NONrem_placeCells = wake_rem_NONrem(idx3,:); 

sTable7 = array2table(wake_rem_NONrem_placeCells, ...
    'VariableNames', {'Wake' , 'Rem ', 'NONRem' ,'PlaceCells'} );







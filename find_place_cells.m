% This function takes in two thresholds and outputs the corresponding
% place cells given an array of values from the mutual information and
% stability of each cell. 


function [place_cells, stab] = find_place_cells(Stability,threshold_Stab) 

  stab = find(Stability>threshold_Stab); 
%  mi = find(MI>threshold_MI);
  place_cells = stab; 


end 
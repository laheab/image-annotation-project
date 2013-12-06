function [ recall,precision ] = measureRecallAndPrecision(CMRM_captions, real_captions,number_of_captions_of_importance )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

CMRM_captions = CMRM_captions(:,1:number_of_captions_of_importance);

num_of_images = size(CMRM_captions,1);
recall = zeros(1,num_of_images);
precision = zeros(1,num_of_images);

for i = 1:num_of_images
length_of_relevant = length(find(real_captions(i,:) > 0));
relevant = real_captions(i,1:length_of_relevant);
retrieved = CMRM_captions(i,:);
retrieved_intersect_relevant = intersect(retrieved, relevant);

length_of_retrieved_intersect_relevant = length(retrieved_intersect_relevant);

recall(i) = length_of_retrieved_intersect_relevant / length_of_relevant;
precision(i) = length_of_retrieved_intersect_relevant / length(retrieved);

%fprintf('Finished Image %d\n', i);   

end


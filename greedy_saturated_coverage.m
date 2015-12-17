function list = greedy_saturated_coverage(similarity_mat, K, ratio)
N = size(similarity_mat, 1);
singleton_val = sum(similarity_mat);
threshold = ratio * singleton_val;
remain_list = 1:N;
list = [];
for idx = 1:K
    max_value = -inf;
    
    for jdx = 1:length(remain_list)
        new_list = [list, remain_list(jdx)];
        if length(new_list) == 1
            value = sum(similarity_mat(new_list,:));
        else
            %value = sum(max(similarity_mat(new_list,:)));
            value = sum(min([sum(similarity_mat(new_list,:)); threshold]));
        end
        if value > max_value
            max_value = value;
            max_index = remain_list(jdx);
        end
    end
    list = [list, max_index];
    remain_list = setdiff(remain_list, max_index);
end
end
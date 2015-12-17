function list = greedy_graphcut_function(similarity_mat, K, lambda1, lambda2)
N = size(similarity_mat, 1);
remain_list = 1:N;
list = [];
for idx = 1:K
    max_value = -inf;
    
    for jdx = 1:length(remain_list)
        new_list = [list, remain_list(jdx)];
        if length(new_list) == 1
            value = lambda1 * sum(similarity_mat(new_list, :)) - lambda2 * (sum(similarity_mat(new_list, new_list)));
        else
            value = lambda1 * sum(sum(similarity_mat(new_list, :))) - lambda2 * sum(sum(similarity_mat(new_list, new_list)));;
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
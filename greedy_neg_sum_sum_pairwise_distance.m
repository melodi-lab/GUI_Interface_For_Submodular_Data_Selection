function list = greedy_neg_sum_sum_pairwise_similarity(sim_mat, K)
N = size(sim_mat, 1);
sim_mat = sim_mat;
%dist_mat(1:N:end) = inf;
remain_list = 1:N;
list = [];
for idx = 1:K
    max_value = -inf;
    
    for jdx = 1:length(remain_list)
        new_list = [list, remain_list(jdx)];
        if length(new_list) == 1
            value = -sum(sim_mat(new_list,new_list));
        else
            value = -sum(sum(sim_mat(new_list,new_list)));
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
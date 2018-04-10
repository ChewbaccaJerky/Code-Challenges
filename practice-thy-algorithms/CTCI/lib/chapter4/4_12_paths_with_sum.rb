=begin

4.12 Paths With Sum
You are given a binary tree in which each node contains an integer value(which might be positive or negative).
Design an algorithm to count the number of paths that sum to a given value. The path does note need to start
or end at the root or a leaf, but it must go downwards(traveling only from parent nodes to child nodes).

=end

def paths_with_sum(node, target, sums = 0, paths = 0)
    return paths if node.nil?

    sums += node.val
    paths += 1 if sums == target

    left = paths_with_sum(node.left, target, sums, paths)
    right = paths_with_sum(node.right, target, sums, paths)

    left + right
end
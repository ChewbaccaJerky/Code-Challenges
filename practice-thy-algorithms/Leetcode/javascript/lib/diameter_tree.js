/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */
var ans = 0;
var diameterOfBinaryTree = function(root) {
    ans = 1;
    depth(root);
    return ans - 1;
};

var depth = function(node) {
    if(node === null) return 0;
    
    let left = depth(node.left);
    let right = depth(node.right);
    
    ans = Math.max(ans, left + right + 1);
    return Math.max(left, right) + 1;
}

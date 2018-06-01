
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left = nil
        @right = nil
    end
end

class BST 
    def initialize()
        @root = nil
    end

    def createBST(arr)
        arr.each do |num|
            insert(num)
        end

        @root
    end

    def insert(num, node = @root)
        
        if @root.nil?
            @root = TreeNode.new(num)
            return @root
        end

        if node.nii?
            return TreeNode.new(num)
        end
           
        if(num < node.val)
            node.left = insert(num, node.left)
        else
            node.right = insert(num, node.right)
        end

        node
    end

    def serialize()
        nodeArr = createBFSArray
        nodeArr.map{|node| node.val}.join(',')
    end

    def deserialize(bst_str)
        new_root = convertStrToBST(bst_str)
        new_root
    end

    private

    def createBFSArray(node = @root)
        result = []
        queue = [node]

        until queue.empty?

            temp = []

            until queue.empty?
                node = queue.shift
                result << node

                temp << node.left if node.left
                temp << node.right if node.right
            end
            queue += temp
        end

        result
    end

    def self.convertStrToBST(str)
        vals = str.split(',').map{|num| num.to_i}
        bst = BST.new
        bst.createBST(vals)
    end
end


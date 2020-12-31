class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end
    
    def parent
        @parent
    end

    def children
        @children
    end

    def parent=(node)
        @parent.children.reject!{|child| child == self} unless @parent.nil?
        @parent = node
        @parent.children << self unless @parent.nil?
    end

    def value
        @value
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Bad child=!" unless self.children.include? child_node
        child_node.parent = nil 
    end

    def dfs(target_value)
        return self if @value == target_value
        @children.each do |child|
            res = child.dfs(target_value)
            return res unless res == nil
        end
        nil
    end

    def bfs(target_value)

        q = [self]

        while q.empty? == false
            ele = q.shift
            return ele if ele.value == target_value
            ele.children.each do |child|
                q << child
            end
        end

    end
    
    def inspect
        @value.inspect
    end

end
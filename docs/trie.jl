import Base:show

mutable struct Node
    value::Char
    is_end::Bool
    children::Dict{Char,Node}  
    function Node(value::Char) 
        self = new()
        self.value = value 
        self.is_end = false
        self.children = Dict{Char,Node}()
        return self
    end
end 

mutable struct Trie
    root::Node
    function Trie()
        new(Node('\0'))
    end 
end

function insert!(T::Trie,word::String)
    node = T.root
    for w in word
        if w in keys(node.children)
            node = node.children[w]
        else 
            new_node = Node(w)
            push!(node.children,w=> new_node)
            node = new_node
        end 
    end 
    node.is_end = true
end

function search(T::Trie,word::String)
    node = T.root 
    for w in word
        if w in keys(node.children)
            node = node.children[w]
        else 
            return false 
        end 
    end 
    return node.is_end
end


import Base:push!,insert!,length,contains


mutable struct BinaryTree{T}

    value::Union{T,Nothing}
    left::Union{Nothing,BinaryTree{T}}
    right::Union{Nothing,BinaryTree{T}}

    BinaryTree{T}() where T = new{T}(nothing,nothing,nothing)
    BinaryTree{T}(value::T) where T = new{T}(value,nothing,nothing)

end 

function insert!(r::BinaryTree{T},v::T) where T 
    current_node = r 
    while true 
        if current_node.value > v
            if  isa(current_node.left,Nothing) 
                current_node.left = BinaryTree{T}(v)
                break 
            else 
                current_node = current_node.left 
            end 

        elseif current_node.value < v
            if isa(current_node.right,Nothing) 
                current_node.right = BinaryTree{T}(v)
                break
            else 
                current_node = current_node.right
            end
        end 
    end 
    return current_node
end   

### Not working 
function contains(r::BinaryTree{T},v::T) where T
    current_node = r
    while !isa(current_node.value,Nothing)
        if current_node.value < v
            current_node = current_node.left
        elseif current_node.value > v 
            current_node = current_node.right 
        else 
            return true  
        end        
    end 
    return false
end


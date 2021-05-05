import Base:isempty,length,push!,pop!,showerror

struct Empyt<:Exception
    msg::String
end

showerror(io::IO,e::Empyt) = print(io,"The $(e.msg) is empty")

mutable struct Stack{T}
    data::Vector{T}
    Stack{T}() where T = new([])
end 

isempty(s::Stack) = isempty(s.data)
length(s::Stack) = length(s.data)
push!(s::Stack,x) = push!(s.data,x)
top(s::Stack) = isempty(s) ?  throw(Empyt("Stack")) : return s.data[end]
pop!(s::Stack) = isempty(s) ? throw(Empyt("Stack")) : pop!(s.data)




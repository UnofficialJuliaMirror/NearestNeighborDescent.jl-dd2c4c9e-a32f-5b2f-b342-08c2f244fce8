# Implement the AbstractGraph interface from LightGraphs.jl

import LightGraphs

"""
A directed graph where each node has edges to its (approximate) k-nearest
neighbors.
"""
struct DescentGraph <: AbstractGraph end


"""
Return an iterator (or collection of) the edges of a graph.
"""
function edges(g::DescentGraph) end

function Base.eltype(g::DescentGraph) end

function edgetype(g::DescentGraph) end

function has_edge(g::DescentGraph, s, d) end

# (optional)
function has_edge(g::DescentGraph, e) end

function has_vertex(g::DescentGraph, v) end

"""
Return a list of all neighbors connected to vertex `v` by an incoming edge.
"""
function inneighbors(g::DescentGraph, v) end

function outneighbors(g::DescentGraph, v) end

neighbors(g::DescentGraph, v) = outneighbors(g, v)

function ne(g::DescentGraph) end

function nv(g::DescentGraph) end

"""
Return an iterator or collection of the vertices in the graph.
"""
function vertices(g::DescentGraph) end

is_directed(g::DescentGraph) = true
is_directed(::Type{DescentGraph}) = true

"""
Return the edge weights for this graph.
"""
function weights(g::DescentGraph)<:AbstractMatrix{<:Real} end

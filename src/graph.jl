# Implement the AbstractGraph interface from LightGraphs.jl


import LightGraphs: AbstractGraph, AbstractEdge
import Distances: PreMetric
import DataStructures: AbstractHeap

abstract type AbstractDescentEdge{T <: Integer, U <: Real} <: AbstractEdge{T} end

struct DescentEdge{T, U} <: AbstractDescentEdge{T, U}
    srcidx::T
    dstidx::T
    dist::U
    flag::Bool
end

abstract type AbstractDescentGraph <: AbstractGraph end

"""
A directed graph where each node has edges to its (approximate) k-nearest
neighbors.
"""
struct DescentGraph{VT,
                    DT <: AbstractVector{VT},
                    M <: PreMetric,
                    HT,
                    H <: AbstractVector{<:AbstractHeap{HT}}} <: AbstractDescentGraph
    data::DT
    metric::M
    _knn_heaps::H
end


"""
Return an iterator (or collection of) the edges of a graph.
"""
# Presently, edges are stored as knn_heaps[i][j].idx. The source is
# the index into the heaps, the dest is the `idx` field on the
# element tuples.
function edges(g::DescentGraph) end

# The *technical* element types of the descent graph are
# the points (vectors) in the dataset.
Base.eltype(g::DescentGraph{VT}) where VT = VT

function edgetype(g::DescentGraph) end

function has_edge(g::DescentGraph, s, d) end

# (optional)
function has_edge(g::DescentGraph, e) end

# if the element type are points / vectors, this might be
# tricky. strings would work fine... but it might depend on
# if the same vector / data point can exist as separate
# vertices, or not...
function has_vertex(g::DescentGraph, v) end

"""
Return a list of all neighbors connected to vertex `v` by an incoming edge.
"""
# with the current knn heaps structure, inneighbors will be
# much less efficient than outneighbors. it will require
# traversing all the knn heaps to find outneighbors with
# `v` as the destination
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

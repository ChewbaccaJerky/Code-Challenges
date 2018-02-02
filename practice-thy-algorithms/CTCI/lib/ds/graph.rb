class Vector
    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end
end

class Edge
    attr_reader :vertices, :undirected

    def initialize(start_vertex, end_vertex, undirected=true)
        @vertices = [start_vertex, end_vertex]
        @undirected = undirected
    end
end

class Graph
    attr_reader :vertices

    def initialize
        @vertices = {}
        @edges = []
    end

    def add_vertex(value)
        @vertices[value] << Vector.new(value)
    end

    def find_vertex_by_value(value)
        @vertices[value]
    end

    def add_edge(start, to, undirected = true)
        vertex1 = self.find_by_value(start)
        vertex2 = self.find_by_value(to)
        
        # both vertices must exist
        if vertex1 && vertex2
            edge = Edge.new(vertex1, vertex2, undirected)
            if undirected
                self._add_edge(vertex1, edge)
                self._add_edge(vertex2, edge)
                self._add_neighbors(vertex1, vertex2)
                self._add_neighbors(vertex2, vertex1)
            else
                self._add_edge(vertex1, edge)
                self._add_neighbors(vertex1, vertex2)
            end
            nil
        else
            false
        end
    end

    def find_edge_by_values(val1, val2)
        vert1 = find_vertex_by_value(val1)
        vert2 = find_vertex_by_value(val2)

        @edges[vert1].each do |edge|
            return edge if edge.vertices.include?(vert2)
        end

        @edges[vert2].each do |edge|
            return edge if edge.vertices.include?(vert1)
        end

        false

    end

    private 
    
    def _add_edge(vertex, edge)
        if @edge[vertex].nil?
            @edge[vertex] = [edge]
        else
            @edge[vertex] << edge
        end
    end

    def _add_neighbors(start_vert, end_vert)
        @vetices[start_vert.value].neighbors << end_vert
    end
end
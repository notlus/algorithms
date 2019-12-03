open class AdjacencyList<T: Hashable>: CustomStringConvertible {
    public var adjacencyDict: [Vertex<T>: [Vertex<T>]] = [:]
    public init() {}

    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex<T>(data: data)
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }

        return vertex
    }

    public func getAllVertices() -> [Vertex<T>] {
        Array(adjacencyDict.keys)
    }

    public func getAdjacents(vertex: Vertex<T>) -> [Vertex<T>] {
        if let adjacents = adjacencyDict[vertex] {
            return adjacents
        }

        return []
    }

    public func addEdge(from source: Vertex<T>, to destination: Vertex<T>) {
        adjacencyDict[source]?.append(destination)
    }

    public var description: String {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge), ")
                } else {
                    edgeString.append("\(edge)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        return result
    }
}

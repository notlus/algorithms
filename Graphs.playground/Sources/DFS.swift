import Foundation

/// Depth-first implementation

extension AdjacencyList {
    // Track the vertices that have been visited
    typealias VisitedSet = Set<Vertex<T>>

    /// Depth-first search
    public func dfs() {
        var visited = VisitedSet()
        for vertex in getAllVertices() {
            if visited.contains(vertex) {
                continue
            }
            dfs(vertex: vertex, visited: &visited)
        }
    }

    private func dfs(vertex: Vertex<T>, visited: inout VisitedSet) {
        visited.insert(vertex)
        print("DFS processing \(vertex)")
        for edge in getAdjacents(vertex: vertex) {
            if visited.contains(edge) {
                continue
            }
            dfs(vertex: edge, visited: &visited)
        }
    }
}

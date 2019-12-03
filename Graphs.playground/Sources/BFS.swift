import Foundation

extension AdjacencyList {
    typealias FrontierQueue = Queue<Vertex<T>>

    /// Perform a breadth-first seach on all vertices.
    public func bfs() {
        var frontier = FrontierQueue()

        let vertices = getAllVertices()
        for v in vertices {
            print("bfs for vertex \(v)")
            frontier.enqueue(data: v)
            bfs(queue: &frontier)
        }
    }

    private func bfs(queue: inout FrontierQueue) {
        var parentMap = [Vertex<T>: Vertex<T>]()
        var visited = VisitedSet()

        while !queue.isEmpty() {
            if let vertex = queue.deque() {
                if visited.contains(vertex) {
                    continue
                }

                // Process the vertex
                print("bfs processing \(vertex)")
                visited.insert(vertex)

                // Enqueue this vertex's edges
                for edge in getAdjacents(vertex: vertex) {
                    if visited.contains(edge) {
                        continue
                    }

                    parentMap[edge] = vertex
                    queue.enqueue(data: edge)
                }
            }
        }

        print("parent map: \(parentMap)")
        print("done\n\n")
    }

    /// Given to vertices, determine whether a path exists between them.
    public func pathExists(from start: Vertex<T>, to end: Vertex<T>) -> Bool {
        if start == end {
            return true
        }

        var frontier = FrontierQueue()
        var visited = VisitedSet()

        frontier.enqueue(data: start)
        while !frontier.isEmpty() {
            if let vertex = frontier.deque() {
                if visited.contains(vertex) {
                    continue
                }

                // Process the vertex
                if vertex == end {
                    return true
                }

                visited.insert(vertex)

                // Enqueue this vertex's edges
                for edge in getAdjacents(vertex: vertex) {
                    if visited.contains(edge) {
                        continue
                    }

                    frontier.enqueue(data: edge)
                }
            }
        }

        return false
    }

    /// Given two vertices, return the path between them, if it exists.
    public func findPath(from start: Vertex<T>, to end: Vertex<T>) -> [Vertex<T>]? {
        var frontier = FrontierQueue()
        var visited = VisitedSet()
        var parentMap = [Vertex<T>: Vertex<T>]()
        var path = [Vertex<T>]()

        frontier.enqueue(data: start)
        parentMap[start] = nil
        while !frontier.isEmpty() {
            if let vertex = frontier.deque() {
                if visited.contains(vertex) {
                    continue
                }

                // Process the vertex
                if vertex == end {
                    break
                }

                visited.insert(vertex)

                // Enqueue this vertex's edges
                for edge in getAdjacents(vertex: vertex) {
                    if visited.contains(edge) {
                        continue
                    }

                    parentMap[edge] = vertex
                    frontier.enqueue(data: edge)
                }
            }
        }

        path.append(end)
        var next: Vertex<T> = end
        while let v = parentMap[next] {
            path.append(v)
            next = v
        }

        return path.reversed()
    }
}

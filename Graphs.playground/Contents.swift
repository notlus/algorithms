import Foundation
import XCPlayground

let adjacencyList = AdjacencyList<String>()
let vA = adjacencyList.createVertex(data: "A")
let vB = adjacencyList.createVertex(data: "B")
let vC = adjacencyList.createVertex(data: "C")
let vD = adjacencyList.createVertex(data: "D")

adjacencyList.addEdge(from: vA, to: vB)
adjacencyList.addEdge(from: vA, to: vC)
//adjacencyList.addEdge(from: vB, to: vA)
adjacencyList.addEdge(from: vB, to: vC)
adjacencyList.addEdge(from: vB, to: vD)
//adjacencyList.addEdge(from: v3, to: v2)
//adjacencyList.addEdge(from: v4, to: v2)
//print(adjacencyList)


adjacencyList.dfs()


//var q = Queue<Int>()
//q.enqueue(data: 1)
//q.enqueue(data: 2)
//q.enqueue(data: 3)
//q.enqueue(data: 4)
//q.enqueue(data: 5)
//
//print(q)
//
//q.deque()
//q.deque()
//q.deque()
//
//print(q)

adjacencyList.bfs()
if adjacencyList.pathExists(from: vA, to: vB) {
    print("Path exists from A to B")
}

print(adjacencyList.pathExists(from: vA, to: vB))
if let path = adjacencyList.findPath(from: vA, to: vD) {
    print(path)
}

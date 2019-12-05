import Foundation

var list = LinkedList<Int>()
list.append(element: 1)
list.append(element: 2)
list.append(element: 3)
list.insertFront(element: 99)

print(list)
print("head: \(list.first!)")
print("tail: \(list.last!)")

var n = list.first!.next!
print("n: \(n)")
list.moveToFront(node: n)
print(list)
print("head: \(list.first!)")
print("tail: \(list.last!)")

n = list.first!.next!.next!
list.moveToFront(node: n)
print(list)
print("head: \(list.first!)")
print("tail: \(list.last!)")

/// A Swift Least-Recently-Used cache implemenation using a dictionary and a queue.

public class LRUCache<T: Comparable> {
    private let cacheSize: Int
    private var currentCacheSize = 0
    private var cache = LinkedList<T>()
    
    // A map of pages to elements
    private var map = [Int: Node<T>]()
    
    public init(cacheSize: Int) {
        self.cacheSize = cacheSize
    }
    
    public func put(key: Int, element: T) {
        if currentCacheSize < cacheSize {
            cache.append(element: element)
        }
        else {
            // Need to evict the last element
            let _ = cache.removeLast()
            cache.append(element: element)
        }
    }
    
    public func get(key: Int) -> T? {
        if let element = map[key] {
            // Move to the front of the queue
            cache.moveToFront(node: element)
            return element.data
        }
        
        return nil
    }
}

var lru = LRUCache<Int>(cacheSize: 4)


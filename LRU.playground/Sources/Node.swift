/// An implementation of a node type, suitable for use in a linked list
public class Node<T: Comparable>: CustomStringConvertible {
    public init(_ data: T) {
        self.data = data
    }
    
    deinit {
        print("Node deinit: \(self)")
    }
    
    public var next: Node?
    public var prev: Node?
    public let data: T
    
    public var description: String {
        var desc = "data: \(data)"
        if let p = prev {
            desc += " prev: \(p.data)"
        }
        
        if let n = next {
            desc += " next: \(n.data)"
        }
        
        return desc
    }
}

extension Node: Comparable {
    /// Comparable
    public static func < (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data < rhs.data
    }
    
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.data == rhs.data
    }
}

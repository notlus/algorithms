/// A doubly linked list implementation
public class LinkedList<T: Comparable>: CustomStringConvertible {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    public init() {}
    
    /// Append to the end of the list
    public func append(element: T) {
        let node = Node(element)
        if head == nil {
            head = node
            tail = node
        }
        else {
            tail?.next = node
            node.prev = tail
            tail = node
        }
    }
    
    public func insertFront(element: T) {
        let node = Node(element)
        node.next = head
        head?.prev = node
        head = node
    }
    
    /// Remove the first element from the list
    public func removeFirst() -> T? {
        if let node = head {
            head = head?.next
            head?.prev = nil
            
            // The tail element was removed
            if head == nil {
                tail = nil
            }
            
            return node.data
        }
        
        return nil
    }
    
    /// Remove the last element from the list
    public func removeLast() -> T? {
        if tail == nil {
            // Empty list
            return nil
        }
        
        tail?.prev?.next = nil
        
        return tail?.data
    }
    
    /// Move `node` to the front of the list
    public func moveToFront(node: Node<T>) {
        if let h = head {
            if h == node {
                print("Already head node")
                return
            }
        }
        
        if node.next == tail {
            tail?.prev = node.prev
        }
        else if node == tail {
            tail = node.prev
        }
        
        node.prev?.next = node.next
        node.next = head
        node.prev = nil
        head = node
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var description: String {
        var desc = "Data:"
        var temp: Node<T>? = head
        while temp != nil {
            desc += " \(temp!.data)"
            temp = temp?.next
        }
        
        return desc
    }
}


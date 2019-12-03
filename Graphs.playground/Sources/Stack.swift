import Foundation

public struct Stack<T> {
    public init() {}
    private var container = [T]()

    public mutating func push(element: T) {
        container.append(element)
    }

    public mutating func pop() -> T? {
        return container.popLast()
    }

    public func top() -> T? {
        return container.last
    }

    public func isEmpty() -> Bool {
        return container.isEmpty
    }
}

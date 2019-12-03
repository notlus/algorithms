import Foundation

public struct Queue<T> {
    public init() {}
    private var container = [T]()

    public mutating func enqueue(data: T) {
        container.append(data)
    }

    public mutating func deque() -> T? {
        if container.isEmpty {
            return nil
        }

        return container.removeFirst()
    }

    public func isEmpty() -> Bool {
        return container.isEmpty
    }

    public func count() -> Int {
        return container.count
    }
}

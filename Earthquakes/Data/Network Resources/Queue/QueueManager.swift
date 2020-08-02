import Foundation

class QueueManager {
    
    lazy var queue: OperationQueue = {
        let quque = OperationQueue()
        
        return quque
    }()
    
    static let shared = QueueManager()
    
    func enquqe(_ operation: Operation) {
        queue.addOperation(operation)
    }
}

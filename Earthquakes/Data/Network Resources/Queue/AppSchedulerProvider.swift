import Foundation
import RxSwift

protocol SchedulerProvider {
    func ui() -> ImmediateSchedulerType
    func io() -> ImmediateSchedulerType
}

class AppSchedulerProvider: SchedulerProvider {
    
    private let queue: OperationQueue
    
    init(queue: OperationQueue = QueueManager.shared.queue) {
        self.queue = queue
    }
    
    func ui() -> ImmediateSchedulerType {
        return MainScheduler()
    }
    
    func io() -> ImmediateSchedulerType {
        return OperationQueueScheduler(operationQueue: queue)
    }
}

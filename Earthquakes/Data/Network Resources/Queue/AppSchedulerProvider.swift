//
//  AppSchedulerProvider.swift
//  Round Up
//
//  Created by Shrawan Zadoo on 02/05/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

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

//
//  QueueManager.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 26/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

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

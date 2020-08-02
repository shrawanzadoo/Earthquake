//
//  MockSchedulerProvider.swift
//  EarthquakesTests
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation
import RxSwift
@testable import Earthquakes

class MockSchedulerProvider: SchedulerProvider {
  func ui() -> ImmediateSchedulerType {
    return CurrentThreadScheduler.instance
  }
  
  func io() -> ImmediateSchedulerType {
    return CurrentThreadScheduler.instance
  }
}


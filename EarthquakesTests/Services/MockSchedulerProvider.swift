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


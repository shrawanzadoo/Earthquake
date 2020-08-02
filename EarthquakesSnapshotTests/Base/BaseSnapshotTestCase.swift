//
//  BaseSnapshotTestCase.swift
//  NewsFeedSnapshotTests
//
//  Created by Shrawan Zadoo on 02/08/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import FBSnapshotTestCase
@testable import Earthquakes

class BaseSnapshotTestCase: FBSnapshotTestCase {
    
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    if ProcessInfo.processInfo.environment["RECORD_MODE"] != nil {
      self.recordMode = true
    }
  }
}

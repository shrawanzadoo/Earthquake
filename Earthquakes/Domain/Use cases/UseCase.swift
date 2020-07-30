//
//  EarthquakesRepository.swift
//  Earthquakes
//
//  Created by Shrawan Zadoo on 27/07/2020.
//  Copyright © 2020 Shrawan Zadoo. All rights reserved.
//

import Foundation
import RxSwift

protocol UseCase {
    associatedtype Q
    associatedtype T
    func execute(_ requestValues: Q) -> Observable<T>
}

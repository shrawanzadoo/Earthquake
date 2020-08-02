import Foundation
import RxSwift

protocol UseCase {
    associatedtype Q
    associatedtype T
    func execute(_ requestValues: Q) -> Observable<T>
}

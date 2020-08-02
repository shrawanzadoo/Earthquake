import XCTest
import RxSwift
@testable import Earthquakes

class EarthquakesPresenterTest: XCTestCase {
    let mockScheduler = MockSchedulerProvider()
    
    var view: MockEarthquakesViewContract!
    // Repos
    var mockEarthquakesRepository: MockEarthquakesRepository!
    // Use case
    var mockGetEarthquakes: GetEarthquakes!
    
    var presenter: EarthquakesPresenter!
    
    override func setUp() {
        initPresenter(Observable.just(.success(MockDataHelper.getData())))
    }
    
    private func initPresenter(_ response: Observable<Result<EarthquakesInfo, Error>>) {
        view = MockEarthquakesViewContract()
        
        mockEarthquakesRepository = MockEarthquakesRepository()
        
        mockEarthquakesRepository.getEathquakesReturn = response
        
        mockGetEarthquakes = GetEarthquakes(
            earthquakesRepository: mockEarthquakesRepository
        )
        
        presenter = EarthquakesPresenter(
            scheduler: mockScheduler,
            getEarthquakesUseCase: mockGetEarthquakes
        )
        
        presenter.takeView(view)
    }
    
    // API call verification
    func testEarthquakesFetched() {
        XCTAssertEqual(1, mockEarthquakesRepository.getEathquakesCount)
    }
    
    // View intereaction
    func testEarthquakesSetOnView() {
        XCTAssertEqual(1, view.updateEarthquakesCount)
        XCTAssertEqual(3, view.updateEarthquakesParams[0].count)
        
        // verify intesity logic
        XCTAssertEqual(Intensity.low, view.updateEarthquakesParams[0][0].intensity)
        XCTAssertEqual(Intensity.high, view.updateEarthquakesParams[0][1].intensity)
        XCTAssertEqual(Intensity.low, view.updateEarthquakesParams[0][2].intensity)
        
        XCTAssertEqual(1, view.showLoadingCount)
        XCTAssertEqual(1, view.hideLoadingCount)
    }
    
    func testNoDataError() {
        initPresenter(Observable.just(.failure(BaseError.noData)))
        
        XCTAssertEqual(1, view.showLoadingCount)
        XCTAssertEqual(1, view.showAlertCount)
        XCTAssertEqual("Sorry, no data found. Please check your Internet connction.", view.showAlertParams[0].message)
        XCTAssertEqual(1, view.hideLoadingCount)
    }
    
    func testParsingError() {
        initPresenter(Observable.just(.failure(BaseError.parsingError)))
        
        XCTAssertEqual(1, view.showLoadingCount)
        XCTAssertEqual(1, view.showAlertCount)
        XCTAssertEqual("Looks like data is malformed.", view.showAlertParams[0].message)
        XCTAssertEqual(1, view.hideLoadingCount)
    }
}

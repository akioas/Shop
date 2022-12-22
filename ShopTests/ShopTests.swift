

import XCTest
@testable import Shop

final class ShopTests: XCTestCase {
    
    var viewModel: MyCartViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = MyCartViewModel()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        viewModel = nil
        try super.tearDownWithError()

        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasketCount() throws {
        let basket = [Basket(id: 1, images: "", price: 100, title: "11"),
                        Basket(id: 3, images: "", price: 200, title: "-"),
                      Basket(id: 3, images: "", price: 200, title: "-")]
        let cartData = MyCartData(basket: basket, delivery: "Free", id: "9", total: 99)
        let basketCount = [1 : 1, 3 : 2]
        viewModel.cartData = cartData
        viewModel.getBasketIdCountDict()
        XCTAssertEqual(viewModel.basketCountDict, basketCount)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

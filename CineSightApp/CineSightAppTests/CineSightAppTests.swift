import XCTest
@testable import CineSightApp

class MovieServiceTests: XCTestCase {

    // Create a mock URLProtocol
    class MockURLProtocol: URLProtocol {
        override class func canInit(with request: URLRequest) -> Bool {
            return true
        }

        override class func canonicalRequest(for request: URLRequest) -> URLRequest {
            return request
        }

        override func startLoading() {
            
            let testData = """
                {
                    "results": [
                        {
                            "title": "Star",
                            "release_date": "2001-06-01",
                            
                        },
                        {
                            "title": "Star!",
                            "release_date": "1968-07-18",
                            
                        }
                    ]
                }
                """.data(using: .utf8)

            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)

            client?.urlProtocol(self, didReceive: response!, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: testData!)
            client?.urlProtocolDidFinishLoading(self)
        }

        override func stopLoading() {
            // Nothing to do here
        }
    }

    override func setUp() {
        super.setUp()
       
        URLProtocol.registerClass(MockURLProtocol.self)
    }

    override func tearDown() {
        super.tearDown()
     
        URLProtocol.unregisterClass(MockURLProtocol.self)
    }

    func testSearchMovies() {
       
        let movieService = MovieService()

        
        let expectation = self.expectation(description: "Search Movies")

       
        movieService.searchMovies(query: "Test") { result in
            switch result {
            case .success(let movies):
                XCTAssertEqual(movies.count, 2)
                XCTAssertEqual(movies[0].title, "Star")
                XCTAssertEqual(movies[1].title, "Star!")
                XCTAssertEqual(movies[0].release_date, "2001-06-01")
                XCTAssertEqual(movies[1].release_date, "1968-07-18")
            case .failure(let error):
                XCTFail("Search should succeed, but failed with error: \(error)")
            }
            expectation.fulfill()
        }

        // Wait for the expectation to be fulfilled
        waitForExpectations(timeout: 5, handler: nil)
    }
}




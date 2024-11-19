// FS Error Middleware
// Copyright (C) 2024  FREEDOM SPACE, LLC

//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Affero General Public License as published
//  by the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Affero General Public License for more details.
//
//  You should have received a copy of the GNU Affero General Public License
//  along with this program.  If not, see <https://www.gnu.org/licenses/>.

import XCTVapor
@testable import ErrorMiddleware

final class ErrorMiddlewareTests: XCTestCase {
    //  swiftlint: disable implicitly_unwrapped_optional
    var app: Application!
    //  swiftlint: enable implicitly_unwrapped_optional
    override func setUp() async throws {
        app = try await Application.make(.testing)
        app.post("order") { _ -> String in
            return "done"
        }
    }

    override func tearDown() async throws {
        try await app.asyncShutdown()
    }

    func testErrorMiddlewareSnakeCase() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        app.middleware.use(ErrorMiddleware.custom(environment: app.environment, for: 1))

        try app.testable().test(.GET, "order") { res throws in
            let error = try res.content.decode(ErrorResponse.self, using: app.errorDecode)
            XCTAssertEqual(error.isError, true)
            XCTAssertEqual(error.reason, "Not Found")
            XCTAssertEqual(error.error, "404")
            XCTAssertEqual(error.status, "404")
            XCTAssertEqual(error.code, "404.1.")
            XCTAssertEqual(error.errorUri, "https://example.com/doc/errors")
        }
    }

    func testErrorMiddlewareDefaultCase() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        app.middleware.use(ErrorMiddleware.custom(environment: app.environment, for: 1, keyEncodingStrategy: .useDefaultKeys))

        try app.testable().test(.GET, "order") { res throws in
            let error = try res.content.decode(ErrorResponse.self)
            XCTAssertEqual(error.isError, true)
            XCTAssertEqual(error.reason, "Not Found")
            XCTAssertEqual(error.error, "404")
            XCTAssertEqual(error.status, "404")
            XCTAssertEqual(error.code, "404.1.")
            XCTAssertEqual(error.errorUri, "https://example.com/doc/errors")
        }
    }
}

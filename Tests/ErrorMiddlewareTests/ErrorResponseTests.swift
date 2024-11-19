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

//
//  ErrorResponseTests.swift
//  
//
//  Created by Mykola Buhaiov on 18.06.2024.
//

import XCTest
import XCTVapor
@testable import ErrorMiddleware

/// Unit tests for the `ErrorResponse` equatable conformance.
final class ErrorResponseTests: XCTestCase {
    //  swiftlint: disable implicitly_unwrapped_optional
    var app: Application!
    //  swiftlint: enable implicitly_unwrapped_optional
    override func setUp() async throws {
        app = try await Application.make(.testing)
    }

    override func tearDown() async throws {
        try await app.asyncShutdown()
    }
    /// Tests the equality of two `ErrorResponse` instances.
    func testErrorResponseEquatable() {
        let firstErrorResponse = ErrorResponse(
            isError: true,
            reason: "reason of error",
            error: "error",
            status: "404",
            code: "404.1.0000",
            errorUri: "error uri"
        )
        var secondErrorResponse = ErrorResponse(
            isError: true,
            reason: "reason of error",
            error: "error",
            status: "404",
            code: "404.1.0000",
            errorUri: "error uri"
        )
        // Assert that the two instances are equal.
        XCTAssertEqual(firstErrorResponse, secondErrorResponse)
        // Modify a property in the second instance.
        secondErrorResponse.code = "4"
        // Assert that the two instances are not equal after the modification.
        XCTAssertNotEqual(firstErrorResponse, secondErrorResponse)
    }
}

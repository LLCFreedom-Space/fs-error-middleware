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

@testable import ErrorMiddleware
import VaporTesting
import Testing

// swiftlint:disable:next numbers_smell
@Suite("Error middleware tests")
struct ErrorMiddlewareTests {
    private func withApp(_ test: (Application) async throws -> ()) async throws {
        let app = try await Application.make(.testing)
        do {
            app.post("order") { _ -> String in
                return "done"
            }
            try await test(app)
        } catch {
            throw error
        }
        try await app.asyncShutdown()
    }

    @Test("Error middleware snake case")
    func errorMiddlewareSnakeCase() async throws {
        try await withApp { app in
            app.middleware.use(ErrorMiddleware.custom(environment: app.environment, for: 1))

            try await app.test(.GET, "order") { res throws in
                let error = try res.content.decode(ErrorResponse.self, using: app.errorDecode)
                #expect(error.isError == true)
                #expect(error.reason == "Not Found")
                #expect(error.error == "404")
                #expect(error.status == 404)
                #expect(error.code == "404.1.")
                #expect(error.errorUri == "https://example.com/doc/errors")
            }
        }
    }

    @Test("Error middleware default case")
    func errorMiddlewareDefaultCase() async throws {
        try await withApp { app in
            app.middleware.use(ErrorMiddleware.custom(environment: app.environment, for: 1, keyEncodingStrategy: .useDefaultKeys))

            try await app.test(.GET, "order") { res throws in
                let error = try res.content.decode(ErrorResponse.self)
                #expect(error.isError == true)
                #expect(error.reason == "Not Found")
                #expect(error.error == "404")
                #expect(error.status == 404)
                #expect(error.code == "404.1.")
                #expect(error.errorUri == "https://example.com/doc/errors")
            }
        }
    }
}
// swiftlint:disable:previous numbers_smell

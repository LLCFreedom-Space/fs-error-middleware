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
//  ErrorMiddleware.swift
//
//
//  Created by Mykola Buhaiov on 14.06.2024.
//

import Vapor

/// Extension for ErrorMiddleware.
public extension ErrorMiddleware {
    /// Creates a custom `ErrorMiddleware` instance with specialized error handling based on the application's environment and a provided numeric identifier.
    /// This middleware intercepts errors during request processing and generates consistent error responses for various error types, ensuring user-friendly messaging and detailed error information when appropriate.
    /// - Parameter environment: The current running environment of the application, which is typically development, testing, or release. This is used to adjust the verbosity of error messages, revealing more detailed error information in non-release modes.
    /// - Parameter number: A custom numeric identifier used to build unique error codes for tracking and reference.
    /// - Returns: Returns an instance of `ErrorMiddleware` configured to process errors based on the provided environment and numeric identifier. This middleware standardizes error responses and logs detailed error information.
    static func custom(environment: Environment, for number: Int) -> ErrorMiddleware {
        ErrorMiddleware { req, error in
            let httpStatus: HTTPResponseStatus
            let reason: String
            let headers: HTTPHeaders
            let identifier: String?
            let status: String
            let code: String
            switch error {
            case let appError as AppError:
                reason = appError.reason
                httpStatus = appError.status
                headers = appError.headers
                identifier = appError.identifier
                status = appError.status.code.description
                code = "\(appError.status.code.description).\(number).\(appError.number)"
            case let abort as AbortError:
                /// This is an abort error, we should use its status, reason, and headers
                reason = abort.reason
                httpStatus = abort.status
                headers = abort.headers
                identifier = abort.status.code.description
                status = "\(abort.status.code)"
                code = "\(abort.status.code).\(number).\(abort.number)"
            case let error as LocalizedError where !environment.isRelease:
                /// If not release mode, and error is debuggable, provide debug
                /// Info directly to the developer
                reason = error.localizedDescription
                httpStatus = .internalServerError
                headers = [:]
                identifier = error.errorDescription
                status = "500"
                code = "500.\(number).0000"
            default:
                /// Not an abort error, and not debuggable or in dev mode
                /// Just deliver a generic 500 to avoid exposing any sensitive error info
                reason = "Something went wrong."
                httpStatus = .internalServerError
                headers = [:]
                identifier = "something_went_wrong"
                status = "500"
                code = "500.\(number).0000"
            }
            /// Report the error to logger.
            req.logger.report(error: error)
            /// Create a Response with appropriate status
            let response = Response(status: httpStatus, headers: headers)
            /// Attempt to serialize the error to json
            do {
                let errorResponse = ErrorResponse(
                    reason: reason,
                    error: identifier,
                    status: status,
                    code: code
                )
                let encoder = req.application.globalEncoder
                response.body = try .init(data: encoder.encode(errorResponse))
                response.headers.replaceOrAdd(name: .contentType, value: "application/json; charset=utf-8")
            } catch {
                response.body = .init(string: "Oops: \(error)")
                response.headers.replaceOrAdd(name: .contentType, value: "text/plain; charset=utf-8")
            }
            return response
        }
    }
}

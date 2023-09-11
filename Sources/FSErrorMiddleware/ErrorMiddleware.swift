//
//  ErrorMiddleware.swift
//
//
//  Created by Mykola Buhaiov on 25.03.2023.
//  Copyright © 2023 Freedom Space LLC
//  All rights reserved: http://opensource.org/licenses/MIT
//

import Vapor

// MARK: Setup ErrorMiddleware
public extension ErrorMiddleware {
    /// Custom `ErrorMiddleware`
    /// - Parameter environment: `Environment`
    /// - Returns: `ErrorMiddleware`
    static func custom(environment: Environment, for number: Int) -> ErrorMiddleware {
        .init { req, error in
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
                let errorResponse = ErrorResponse(isError: true, reason: reason, error: identifier, status: status, code: code)
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

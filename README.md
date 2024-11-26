[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
![GitHub release (with filter)](https://img.shields.io/github/v/release/LLCFreedom-Space/fs-error-middleware)
 [![Read the Docs](https://readthedocs.org/projects/docs/badge/?version=latest)](https://llcfreedom-space.github.io/fs-error-middleware/)
![example workflow](https://github.com/LLCFreedom-Space/fs-error-middleware/actions/workflows/lint.yml/badge.svg?branch=main)
![example workflow](https://github.com/LLCFreedom-Space/fs-error-middleware/actions/workflows/test.yml/badge.svg?branch=main)
 [![codecov](https://codecov.io/github/LLCFreedom-Space/fs-error-middleware/graph/badge.svg?token=2EUIA4OGS9)](https://codecov.io/github/LLCFreedom-Space/fs-error-middleware)

# FS Error Middleware

Error middleware is essential in web applications, particularly in frameworks like Express.js, for several reasons:

## Centralized Error Handling:
Error middleware consolidates error-handling logic in one place, which helps keep your code organized and easier to maintain. This centralized approach ensures consistent error responses across all routes and components of the application.
## Custom Error Responses:
It enables you to send standardized error responses to clients, enhancing the user experience and making debugging easier. Error middleware can provide detailed error messages and HTTP status codes (e.g., 400, 404, 500) based on the error type.
## Logging:
Error middleware allows for logging errors systematically, making it easier to track, analyze, and resolve issues. You can log errors to a database, log files, or monitoring tools, helping you gather valuable information for troubleshooting.
## Global Error Catching:
It catches unexpected errors that may occur anywhere in the request lifecycle, preventing these errors from crashing the server. This "catch-all" approach protects the application and maintains stability, even when unexpected issues arise.
## Security:
By handling errors in middleware, you can hide sensitive information (like stack traces) from users. Instead, you can return a generic error message, which helps secure your application and prevents attackers from learning about its internal workings.
In summary, error middleware is critical for maintaining stability, security, and consistent error handling across a web application, improving both developer and user experience.
## Swift version

The latest version of ErrorMiddleware requires **Swift 5.9** and **MacOS v13** or later. You can download this version of the Swift binaries by following this [link](https://swift.org/download/).

## Usage

### Swift Package Manager

#### Add dependencies using the version
Add the `ErrorMiddleware` package to the dependencies within your application’s `Package.swift` file. Substitute `"x.x.x"` with the latest `ErrorMiddleware` [release](https://github.com/LLCFreedom-Space/fs-error-middleware/releases).
```swift
.package(url: "https://github.com/LLCFreedom-Space/fs-error-middleware.git", from: "x.x.x")
```
Add `ErrorMiddleware` to your target's dependencies:
```swift
.target(name: "ErrorMiddleware", dependencies: ["ErrorMiddleware"]),
```
#### Import package
```swift
import ErrorMiddleware
```

#### Add dependencies using the branch
Add the `ErrorMiddleware` package to the dependencies within your application’s `Package.swift` file. Substitute `"name branch"` with the latest `ErrorMiddleware` [release](https://github.com/LLCFreedom-Space/fs-error-middleware/releases).
```swift
.package(url: "https://github.com/LLCFreedom-Space/fs-error-middleware.git", branch: "name branch")
```
Add `ErrorMiddleware` to your target's dependencies:
```swift
.target(name: "ErrorMiddleware", dependencies: ["ErrorMiddleware"]),
```
#### Import package
```swift
import ErrorMiddleware
```

## Getting Started
To use the `custom` static function to create a custom error middleware in a Vapor application, you need to integrate it into your application's middleware stack. Here’s how you can do it step by step:

### 1. Add the `custom` Middleware to the Application
You’ll typically set up the middleware in the `configure.swift` file (or equivalent) of your Vapor application.

### Example Usage:

```swift
import Vapor

public func configure(_ app: Application) throws {
    // Set the environment
    let environment = app.environment

    // Define a unique number for error codes
    let errorNumber = 42

    // Create the custom error middleware
    let errorMiddleware = ErrorMiddleware.custom(
        environment: environment,
        for: errorNumber,
        keyEncodingStrategy: .convertToSnakeCase // Default; can be omitted
    )

    // Replace the default middleware with the custom middleware
    app.middleware.use(errorMiddleware)

    // Continue with other configurations, like routes
    try routes(app)
}
```

### 2. Explanation of Parameters:
- **`environment`**: The current environment (`app.environment`). It determines how errors are logged and displayed. For example:
  - `isRelease = true`: Hides error details from users.
  - `isRelease = false`: Shows detailed error information for debugging.

- **`number`**: A numeric identifier appended to the error codes. This allows for unique and traceable error codes across your application.

- **`keyEncodingStrategy`** (optional): Specifies how property keys in your error response are encoded. The default is `.convertToSnakeCase`, which transforms properties like `isError` to `is_error` in JSON.

### 3. Result:
With the custom middleware in place:
- Errors thrown in your application will be handled by this middleware.
- Based on the error type (e.g., `AppError`, `AbortError`, or `LocalizedError`), appropriate error responses will be generated.
- Error responses will follow the JSON structure defined by `ErrorResponse`.

### Example Error Response (in JSON):

For a 404 `AbortError`:
```json
{
  "is_error": true,
  "reason": "Not Found",
  "error": "404",
  "status": "404",
  "code": "404.42.1234"
}
```

For a generic internal server error:
```json
{
  "is_error": true,
  "reason": "Something went wrong.",
  "error": "something_went_wrong",
  "status": "500",
  "code": "500.42.0000"
}
```

### 4. Testing the Middleware:
Run your Vapor application, and test with scenarios like:
- Throwing a custom `AppError`.
- Using `Abort(.notFound)` or other `AbortError`.
- Triggering a generic error.

### 5. Optional Improvements:
- Use dependency injection to pass custom parameters for more flexibility.
- Modify the `number` to represent different modules or contexts (e.g., `42` for authentication, `100` for payment systems).
## Links

LLC Freedom Space – [@LLCFreedomSpace](https://twitter.com/llcfreedomspace) – [support@freedomspace.company](mailto:support@freedomspace.company)

Distributed under the GNU AFFERO GENERAL PUBLIC LICENSE Version 3. See [LICENSE.md][license-url] for more information.

 [GitHub](https://github.com/LLCFreedom-Space)

[swift-image]:https://img.shields.io/badge/swift-5.9-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-GPLv3-blue.svg
[license-url]: LICENSE

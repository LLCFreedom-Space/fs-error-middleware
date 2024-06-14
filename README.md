# FS Error Middleware

Quick implementation of error middleware.

## Swift version

The latest version of FSGetAppStatus requires **Swift 5.8** and **MacOS v13** or later. You can download this version of the Swift binaries by following this [link](https://swift.org/download/).

## Usage

### Swift Package Manager

#### Add dependencies using the version
Add the `ErrorMiddleware` package to the dependencies within your application’s `Package.swift` file. Substitute `"x.x.x"` with the latest `ErrorMiddleware` [release](https://github.com/LLCFreedom-Space/fs-error-middleware/releases).
```swift
.package(url: "https://github.com/LLCFreedom-Space/fs-error-middleware.git", from: "x.x.x")
```
Add `FSGetAppStatus` to your target's dependencies:
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
.target(name: "FSGetAppStatus", dependencies: ["ErrorMiddleware"]),
```
#### Import package
```swift
import ErrorMiddleware
```

## Getting Started
An example of a method call from this library 
```
app.middleware.use(ErrorMiddleware.custom(environment: app.environment, for: "ServiceNumberId"))

```
To access the methods that are in this library, you need to call the application, since this library is an extension to the application

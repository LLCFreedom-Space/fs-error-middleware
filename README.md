[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
![GitHub release (with filter)](https://img.shields.io/github/v/release/LLCFreedom-Space/fs-app-store-connect-client)
 [![Read the Docs](https://readthedocs.org/projects/docs/badge/?version=latest)](https://llcfreedom-space.github.io/fs-app-store-connect-client/)
![example workflow](https://github.com/LLCFreedom-Space/fs-app-store-connect-client/actions/workflows/docc.yml/badge.svg?branch=main)
![example workflow](https://github.com/LLCFreedom-Space/fs-app-store-connect-client/actions/workflows/lint.yml/badge.svg?branch=main)
![example workflow](https://github.com/LLCFreedom-Space/fs-app-store-connect-client/actions/workflows/test.yml/badge.svg?branch=main)
 [![codecov](https://codecov.io/github/LLCFreedom-Space/fs-app-store-connect-client/graph/badge.svg?token=2EUIA4OGS9)](https://codecov.io/github/LLCFreedom-Space/fs-app-store-connect-client)

# FS Error Middleware

Quick implementation of error middleware.

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
An example of a method call from this library 
```
app.middleware.use(ErrorMiddleware.custom(environment: app.environment, for: "NumberId"))

```
To access the methods that are in this library, you need to call the application, since this library is an extension to the application

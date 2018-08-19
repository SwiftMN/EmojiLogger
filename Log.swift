//
//  Log.swift
//
//  Created by Steven Vlaminck on 8/18/16.
//

import Foundation

// logLevel allows you to specify the minimum log level to display messages for.
// Example:  setting logLevel to .warn will allow .warn and .error log
// messages to display and prevent .debug and .info messages from displaying.
// It can be updated in the debugger by typing `expr logLevel = Log.trace`
var logLevel: LogLevel = Log.info

// MARK: static log functions

/** trace logging
 - Parameters:
    - message: The message you want to log
    - prefixes: optional items that will be wrapped in square brackets in front of your message
 
 
     📋("my message")
     > 📋 [TRACE] my message
 
     📋("my message", self, #function)
     > 📋 [TRACE] [MyClass] [myFunction(someParam:)] my message
 */
func 📋(_ message: Any, _ prefixes: Any...) {
    Log.trace.output(message, prefixedBy: prefixes)
}

/** debug logging
 - Parameters:
    - message: The message you want to log
    - prefixes: optional items that will be wrapped in square brackets in front of your message
 
 
     🐛("my message")
     > 🐛 [DEBUG] my message
 
     🐛("my message", self, #function)
     > 🐛 [DEBUG] [MyClass] [myFunction(someParam:)] my message
 */
func 🐛(_ message: Any, _ prefixes: Any...) {
    Log.debug.output(message, prefixedBy: prefixes)
}

/** info logging
 - Parameters:
    - message: The message you want to log
    - prefixes: optional items that will be wrapped in square brackets in front of your message
 
 
     🗣("my message")
     > 🗣 [INFO] my message
 
     🗣("my message", self, #function)
     > 🗣 [INFO] [MyClass] [myFunction(someParam:)] my message
 */
func 🗣(_ message: Any, _ prefixes: Any...) {
    Log.info.output(message, prefixedBy: prefixes)
}

/** warn logging
 - Parameters:
    - message: The message you want to log
    - prefixes: optional items that will be wrapped in square brackets in front of your message
 
 
     💥("my message")
     > 💥 [WARN] my message
 
     💥("my message", self, #function)
     > 💥 [WARN] [MyClass] [myFunction(someParam:)] my message
 */
func 💥(_ message: Any, _ prefixes: Any...) {
    Log.warn.output(message, prefixedBy: prefixes)
}

/** error logging
 - Parameters:
    - message: The message you want to log
    - prefixes: optional items that will be wrapped in square brackets in front of your message
 
 
     💩("my message")
     > 💩 [ERROR] my message
 
     💩("my message", self, #function)
     > 💩 [ERROR] [MyClass] [myFunction(someParam:)] my message
 */
func 💩(_ message: Any, _ prefixes: Any...) {
    Log.error.output(message, prefixedBy: prefixes)
}

// MARK: Custom static log functions.
// To add your own custom logging functions, add functions like this one

/** success logging; .info equivalent
 - Parameters:
    - message: The message you want to log
    - prefixes: optional items that will be wrapped in square brackets in front of your message
 
 
     🏅("my message")
     > 🏅 [SUCCESS] my message
 
     🏅("my message", self, #function)
     > 🏅 [SUCCESS] [MyClass] [myFunction(someParam:)] my message
 */
func 🏅(_ message: Any, _ prefixes: Any...) {
    Log.custom(rank: Log.info.rank, prefix: "🏅 [SUCCESS]").output(message, prefixedBy: prefixes)
}

/**
 A convenience protocol that removes the module name from objects that are used as a log prefix
 
 Implementing Loggable allows things like this
 ```
 class Foo: Loggable {
    func test() {
        📋(#function, self)
    }
 }
 ```
 which outputs:
 > 📋 [TRACE] [Foo] test()
 
 Without implementing `Loggable`, the output would be:
 > 📋 [TRACE] [MyModule.Foo] test()
 */
protocol Loggable {
    var logName: String { get }
}
extension Loggable {
    var logName: String {
        return "\(type(of: self))"
    }
}


// MARK: Implementation details

/** Typcial Logging levels
 
 - 📋 trace: trace logging level
 - 🐛 debug: debug logging level
 - 🗣 info: info logging level
 - 💥 warn: warn logging level
 - 💩 error: error logging level
 - custom: a way to add your own custom logging level without needing to add new cases to this enum
 
 If you want to add new cases, consider using `.custom` first. If that's not your thing, go ahead and add new cases. It's your app 🙂
 */
enum Log: LogLevel {
    case trace
    case debug
    case info
    case warn
    case error
    case custom(rank: Int, prefix: String)
    var rank: Int {
        switch self {
        case .trace: return 0
        case .debug: return 1
        case .info: return 2
        case .warn: return 3
        case .error: return 4
        case .custom(let customRank, _): return customRank
        }
    }
    var prefix: String {
        switch self {
        case .trace: return "📋 [TRACE]"
        case .debug: return "🐛 [DEBUG]"
        case .info: return "🗣 [INFO]"
        case .warn: return "💥 [WARN]"
        case .error: return "💩 [ERROR]"
        case .custom(_, let customPrefix): return customPrefix
        }
    }
}


/// The actual implementation details. Implement this protocol if you want to really customize your logging
protocol LogLevel {
    var rank: Int { get }
    var prefix: String { get }
}
extension LogLevel {
    var isLoggable: Bool {
        return logLevel.rank <= self.rank
    }
    func output(_ message: Any, prefixedBy prefixes: [Any] = []) {
        guard isLoggable else { return }
        let prefixedMessage = Self.construct(message: message, prefixedBy: prefixes)
        print("\(prefix) \(prefixedMessage)")
    }
    static func construct(message: Any, prefixedBy prefixes: [Any]) -> Any {
        guard prefixes.count > 0 else {
            return message
        }
        let prefix = prefixes.map {
            if let loggable = $0 as? Loggable {
                return "[\(loggable.logName)]"
            } else {
                return "[\($0)]"
            }
            }.joined(separator: " ")
        return "\(prefix) \(message)"
    }
}

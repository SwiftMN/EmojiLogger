//
//  Log.swift
//
//  Created by Steven Vlaminck on 8/18/16.
//

import Foundation

// logLevel allows you to specify the minimum log level to display messages for.
// Example:  setting logLevel to .warn will allow .warn and .error log
// messages to display and prevent .debug and .info messages from displaying.
var logLevel: LogLevel = .debug

enum LogLevel: Int {
    case debug = 0
    case info
    case warn
    case error
}

extension LogLevel: Comparable {}
func ==(lhs: LogLevel, rhs: LogLevel) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
func >(lhs: LogLevel, rhs: LogLevel) -> Bool  {
    return lhs.rawValue > rhs.rawValue
}
func <(lhs: LogLevel, rhs: LogLevel) -> Bool  {
    return lhs.rawValue < rhs.rawValue
}

struct Log {
    static func custom(level: LogLevel, prefix: String, message: Any) {
        guard logLevel <= level else { return }
        print("\(prefix) \(message)")
    }
    static func debug(_ message: Any) {
        guard logLevel <= LogLevel.debug else { return }
        print("🐛 [DEBUG] \(message)")
    }
    static func info(_ message: Any) {
        guard logLevel <= LogLevel.info else { return }
        print("🗣 [INFO] \(message)")
    }
    static func warn(_ message: Any) {
        guard logLevel <= LogLevel.warn else { return }
        print("💥 [WARN]  \(message)")
    }
    static func error(_ message: Any) {
        guard logLevel <= LogLevel.error else { return }
        print("💩 [ERROR] \(message)")
    }
}

func 🐛(_ message: Any) {
    Log.debug(message)
}
func 🗣(_ message: Any) {
    Log.info(message)
}
func 💥(_ message: Any) {
    Log.warn(message)
}
func 💩(_ message: Any) {
    Log.error(message)
}

func 🏅(_ message: Any) {
    Log.custom(level: .info, prefix: "🏅 [SUCCESS]", message: message)
}

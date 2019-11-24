//
//  Log+Custom.swift
//  EmojiLogger
//
//  Created by Steven Vlaminck on 8/18/16.
//

import Foundation

/** trace logging
 - Parameter message: The message you want to log
 - Parameter prefixes: optional items that will be wrapped in square brackets in front of your message
 
 ```
 📋("my message")
 ```
 > 📋 [TRACE] [MyClass:lineNumber] my message
 */
public func 📋(_ message: @autoclosure () -> Any = #function, prefixedBy prefixes: [Any] = [], _ file: String = #file, _ line: Int = #line) {
  Log.trace.output(message(), prefixedBy: prefixes, file, line)
}

/** debug logging
 - Parameter message: The message you want to log
 - Parameter prefixes: optional items that will be wrapped in square brackets in front of your message
 
 🐛("my message")
 > 🐛 [DEBUG] [MyClass:lineNumber] my message
 */
public func 🐛(_ message: @autoclosure () -> Any, prefixedBy prefixes: [Any] = [], _ file: String = #file, _ line: Int = #line) {
  Log.debug.output(message(), prefixedBy: prefixes, file, line)
}

/** info logging
 - Parameter message: The message you want to log
 - Parameter prefixes: optional items that will be wrapped in square brackets in front of your message
 
 🗣("my message")
 > 🗣 [INFO] [MyClass:lineNumber] my message
 */
public func 🗣(_ message: @autoclosure () -> Any, prefixedBy prefixes: [Any] = [], _ file: String = #file, _ line: Int = #line) {
  Log.info.output(message(), prefixedBy: prefixes, file, line)
}

/** warn logging
 - Parameter message: The message you want to log
 - Parameter prefixes: optional items that will be wrapped in square brackets in front of your message
 
 💥("my message")
 > 💥💥[WARN] [MyClass:lineNumber] my message
 */
public func 💥(_ message: @autoclosure () -> Any, prefixedBy prefixes: [Any] = [], _ file: String = #file, _ line: Int = #line) {
  Log.warn.output(message(), prefixedBy: prefixes, file, line)
}

/** error logging
 - Parameter message: The message you want to log
 - Parameter prefixes: optional items that will be wrapped in square brackets in front of your message
 
 💩("my message")
 > 💩💩[ERROR] [MyClass:lineNumber] my message
 */
public func 💩(_ message: @autoclosure () -> Any, prefixedBy prefixes: [Any] = [], _ file: String = #file, _ line: Int = #line) {
  Log.error.output(message(), prefixedBy: prefixes, file, line)
}

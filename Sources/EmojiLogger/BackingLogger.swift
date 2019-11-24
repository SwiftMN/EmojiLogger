//
//  BackingLogger.swift
//  EmojiLogger
//
//  Created by Steven Vlaminck on 8/18/16.
//

import Foundation

public protocol BackingLogger {
  // whether or not to use the backing logger for console logging or if EmojiLogger should handle console logging
  var logsToConsole: Bool { get }
  func output(message: Any, at level: LogLevel)
}

public var backingLogger: BackingLogger?

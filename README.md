# EmojiLogger
A custom Logger that uses emojis to represent log levels

### Usage

    📋("This is a trace level message")   
    🐛("This is a debug level message")   
    🗣("This is an info level message")   
    💥("This is a warn level message")
    💩("This is an error level message")

>📋 [TRACE] This is a trace level message
🐛 [DEBUG] This is a debug level message  
🗣 [INFO]  This is an info level message  
💥 [WARN]  This is a warn level message  
💩 [ERROR] This is an error level message  

You can easily find these emojis by hitting `ctrl+cmd+space`. Once you use these they will be at the top of your list automatically. To find them the first time, hit `ctrl+cmd+space` and type "clipboard" to find 📋, "bug" to find "🐛", type "speak" to find "🗣", type "crash" to find "💥", and type "poop" to find "💩". I know what you're thinking... Why use the "crash" emoji for warn? Because the poop emoji is funnier. As in "Ahh shit! an error!"

You can also add your own prefixes like this:

    📋("This is a trace level message", self, #function)   
    🐛("This is a debug level message", self, #function)   
    🗣("This is an info level message", self, #function)   
    💥("This is a warn level message", self, #function)
    💩("This is an error level message", self, #function)

>📋 [TRACE] [MyClass] [someFunction()] This is a trace level message
🐛 [DEBUG] [MyClass] [someFunction()] This is a debug level message  
🗣 [INFO]  [MyClass] [someFunction()] This is an info level message  
💥 [WARN]  [MyClass] [someFunction()] This is a warn level message  
💩 [ERROR] [MyClass] [someFunction()] This is an error level message  

### Customization

You can easily make custom logging functions which makes your logging more expressive and allows you to easily filter your logs for your own debugging purposes.

    func 🏅(_ message: Any, _ prefixes: Any...) {
        Log.custom(rank: Log.info.rank, prefix: "🏅 [SUCCESS]").output(message, prefixedBy: prefixes)
    }

Which you would then use like this

    🏅("We totally made an API request")

>🏅 [SUCCESS] We totally made an API request

Or if you're trying to figure some things out by adding `print` messages everywhere, you can add a log message that allows you to easily filter for the things you're looking for. Just don't commit this 😉.

    func 🤔(_ message: Any) {
      Log.custom(rank: Log.debug.rank, prefix: "🤔 [STEVE]").output(message, prefixedBy: prefixes)
    }

    🤔("This is a custom message for Steve. He's trying to figure something out and promises not to commit this line 😊")

>🤔 [STEVE] This is a custom message for Steve. He's trying to figure something out and promises not to commit this line 😊

You can easily find these messages in the console by searching "[STEVE]"

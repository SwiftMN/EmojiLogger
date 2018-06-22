# EmojiLogger
A custom Logger that uses emojis to represent log levels

### Usage

    🐛("This is a debug level message")   
    🗣("This is an info level message")   
    💥("This is a warn level message")
    💩("This is an error level message")

>🐛 [DEBUG] This is a debug level message  
🗣 [INFO]  This is an info level message  
💥 [WARN]  This is a warn level message  
💩 [ERROR] This is an error level message  

You can easily find these emojis by hitting `ctrl+cmd+space`. Once you use these they will be at the top of your list automatically. To find them the first time, hit `ctrl+cmd+space` and type "bug" to find "🐛", type "speak" to find "🗣", type "crash" to find "💥", and type "poop" to find "💩". I know what you're thinking... Why use the "crash" emoji for warn? Because the poop emoji is funnier. As in "Ahh shit! an error!"

You can also use:

    Log.debug("This is a debug level message")
    Log.info("This is an info level message")
    Log.warn("This is a warn level message")
    Log.error("This is an error level message ")

>🐛 [DEBUG] This is a debug level message  
🗣 [INFO]  This is an info level message  
💥 [WARN]  This is a warn level message  
💩 [ERROR] This is an error level message  

### Customization

You can easily make custom logging functions which makes your logging more expressive and allows you to easily filter your logs for your own debugging purposes.

    func 🏅(_ message: Any) {
      Log.custom(level: .info, prefix: "🏅 [SUCCESS]", message: message)
    }

Which you would then use like this

    🏅("We totally made an API request")

>🏅 [SUCCESS] We totally made an API request

Or if you're trying to figure some things out by adding `print` messages everywhere, you can add a log message that allows you to easily filter for the things you're looking for. Just don't commit this 😉.

    func 🤔(_ message: Any) {
      Log.custom(level: .debug, prefix: "🤔 [STEVE]", message: message)
    }

    🤔("This is a custom message for Steve. He's trying to figure something out and promises not to commit this line 😊")

>🤔 [STEVE] This is a custom message for Steve. He's trying to figure something out and promises not to commit this line 😊

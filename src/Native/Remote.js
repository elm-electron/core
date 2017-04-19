const _electron_elm$core$Native_Remote = function () {
    const Ok = _elm_lang$core$Result$Ok
    const Err = _elm_lang$core$Result$Err
    const { remote } = require("electron") // NOTE will throw if not in renderer process ...


    // getCurrentWindow : () -> Result Decode.Value Decode.Value
    const getCurrentWindow = () => {
        try {
            console.log("hi")
            const browserWindow = remote.getCurrentWindow()
            if (!browserWindow) return Err(new Error("Could not get current window."))
            return Ok(browserWindow)
        } catch (error) { return Err(error) }
    }


    const exports =
        { getCurrentWindow
        }
    return exports
}()

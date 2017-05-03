const _electron_elm$core$Native_Remote = function () {
    const Ok = _elm_lang$core$Result$Ok
    const Err = _elm_lang$core$Result$Err
    const { remote } = require("electron")
    if (!remote) throw new Error("Electron.Remote can only be used in the renderer process.")


    // getCurrentWindow : () -> Decode.Value
    const getCurrentWindow = () => {
        try {
            const browserWindow = remote.getCurrentWindow()
            return browserWindow
        } catch (error) { return console.error(error) }
    }


    const exports =
        { getCurrentWindow
        }
    return exports
}()

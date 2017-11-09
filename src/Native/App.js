const _elm_electron$core$Native_App = function () {
    const Ok = _elm_lang$core$Result$Ok
    const Err = _elm_lang$core$Result$Err
    const { app } = require("electron").remote || require("electron")


    // getPath : String -> String
    const getPath = name => {
        try {
            const path = app.getPath(name)
            return path
        } catch (error) { return console.error(error) }
    }


    const exports =
        { getPath
        }
    return exports
}()

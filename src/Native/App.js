const _electron_elm$core$Native_App = function () {
    const Ok = _elm_lang$core$Result$Ok
    const Err = _elm_lang$core$Result$Err
    const { app } = require("electron").remote || require("electron")


    // getPath : String -> Result Decode.Value String
    const getPath = name => {
        try {
            const path = app.getPath(name)
            return Ok(path)
        } catch (error) { return Err(error) }
    }


    const exports =
        { getPath
        }
    return exports
}()

const _electron_elm$core$Native_Dialog = function () {
    const { nativeBinding, succeed, fail } = _elm_lang$core$Native_Scheduler
    const { dialog } = require("electron").remote || require("electron")


    // showOpenDialog : BrowserWindow -> Encode.Value -> Task Decode.Value Decode.Value
    const showOpenDialog = options => nativeBinding(callback => {
        try {
            dialog.showOpenDialog(options, filePaths => {
                // filePaths : List String | undefined
                // TODO can we return an undefined and have Elm automatically translate to maybe?
                return callback(succeed(filePaths || []))
            })
        } catch (error) { return callback(fail(error)) }
    })


    // showModalOpenDialog : BrowserWindow -> Encode.Value -> Task Decode.Value Decode.Value
    const showModalOpenDialog = F2((browserWindow, options) => nativeBinding(callback => {
        try {
            dialog.showOpenDialog(browserWindow, options, filePaths => {
                // filePaths : List String | undefined
                // TODO can we return an undefined and have Elm automatically translate to maybe?
                return callback(succeed(filePaths || []))
            })
        } catch (error) { return callback(fail(error)) }
    }))


    const exports =
        { showOpenDialog
        , showModalOpenDialog
        }
    return exports
}()

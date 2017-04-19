module Electron.Dialog.LowLevel
    exposing
        ( showOpenDialog
        , showModalOpenDialog
        )

import Electron.BrowserWindow exposing (BrowserWindow)
import Json.Decode as Decode
import Json.Encode as Encode
import Task exposing (Task)
import Native.Dialog


showOpenDialog : Encode.Value -> Task Decode.Value Decode.Value
showOpenDialog =
    Native.Dialog.showOpenDialog


showModalOpenDialog : BrowserWindow -> Encode.Value -> Task Decode.Value Decode.Value
showModalOpenDialog =
    Native.Dialog.showModalOpenDialog

module Electron.App.LowLevel
    exposing
        ( getPath
        )

import Json.Decode as Decode
import Native.App


getPath : String -> String
getPath =
    Native.App.getPath

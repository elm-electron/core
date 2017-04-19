module Electron.Remote.LowLevel
    exposing
        ( getCurrentWindow
        )

import Json.Decode as Decode
import Native.Remote


getCurrentWindow : () -> Result Decode.Value Decode.Value
getCurrentWindow =
    Native.Remote.getCurrentWindow

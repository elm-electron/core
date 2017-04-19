module Electron.Remote
    exposing
        ( getCurrentWindow
        )

{-| Electron remote api.

@docs getCurrentWindow

-}

import Electron.Remote.LowLevel as LowLevel
import Electron.BrowserWindow exposing (BrowserWindow)
import Electron.Error as Error exposing (Error)


{-| -}
getCurrentWindow : () -> Result Error BrowserWindow
getCurrentWindow tuple0 =
    LowLevel.getCurrentWindow tuple0
        |> Result.mapError Error.fromValue

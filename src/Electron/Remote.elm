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
getCurrentWindow : () -> BrowserWindow
getCurrentWindow t0 =
    LowLevel.getCurrentWindow t0

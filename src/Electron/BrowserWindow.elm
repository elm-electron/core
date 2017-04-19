module Electron.BrowserWindow
    exposing
        ( BrowserWindow
        )

{-| Native binding to Electron BrowserWindow.

@docs BrowserWindow

-}

import Json.Decode as Decode


{-| -}
type alias BrowserWindow =
    Decode.Value

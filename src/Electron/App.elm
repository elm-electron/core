module Electron.App
    exposing
        ( getPath
        , Path(..)
        )

{-| Electron app.

@docs getPath , Path

-}

import Electron.App.LowLevel as LowLevel
import Electron.Error as Error exposing (Error)
import String.Extra as String


{-| -}
type Path
    = Home
    | AppData
    | UserData
    | Temp
    | Exe
    | Module
    | Desktop
    | Documents
    | Downloads
    | Music
    | Pictures
    | Videos
    | PepperFlashSystemPlugin


pathToString : Path -> String
pathToString =
    Basics.toString >> String.decapitalize


{-| -}
getPath : Path -> Result Error String
getPath path =
    LowLevel.getPath (pathToString path)
        |> Result.mapError Error.fromValue

module Electron.Dialog
    exposing
        ( showOpenDialog
        , showModalOpenDialog
        , defaultOptions
        )

{-| Native bindings for Electrons dialog module.

@docs showOpenDialog , showModalOpenDialog , defaultOptions

-}

import Electron.BrowserWindow exposing (BrowserWindow)
import Electron.Dialog.LowLevel as LowLevel
import Electron.Error as Error exposing (Error(..))
import Electron.FileFilter as FileFilter exposing (FileFilter)
import Json.Decode as Decode
import Json.Encode as Encode
import Json.Encode.Extra as Encode
import Result.Extra as Result
import String.Extra as String
import Task exposing (Task)


type alias Options =
    { title : Maybe String
    , defaultPath : Maybe String
    , buttonLabel : Maybe String
    , filters : List FileFilter
    , properties : List Property
    , normalizeAccessKeys : Bool
    , message : Maybe String
    }


type Property
    = OpenFile
    | OpenDirectory
    | MultiSelections
    | ShowHiddenFiles
    | CreateDirectory
    | PromptToCreate
    | NoResolveAliases


propertyEncodeValue : Property -> Encode.Value
propertyEncodeValue =
    Basics.toString >> String.decapitalize >> Encode.string


{-| -}
defaultOptions : Options
defaultOptions =
    { title = Nothing
    , defaultPath = Nothing
    , buttonLabel = Nothing
    , filters = []
    , properties = [ OpenFile ]
    , normalizeAccessKeys = False
    , message = Nothing
    }


optionsToValue : Options -> Encode.Value
optionsToValue options =
    Encode.object
        [ ( "title", Encode.maybe Encode.string options.title )
        , ( "defaultPath", Encode.maybe Encode.string options.defaultPath )
        , ( "buttonLabel", Encode.maybe Encode.string options.buttonLabel )
        , ( "filters", Encode.list <| List.map FileFilter.encodeValue options.filters )
        , ( "properties", Encode.list <| List.map propertyEncodeValue options.properties )
        , ( "normalizeAccessKeys", Encode.bool options.normalizeAccessKeys )
        , ( "message", Encode.maybe Encode.string options.message )
        ]


listStringFromValue : Decode.Value -> Result Error (List String)
listStringFromValue =
    Decode.decodeValue (Decode.list Decode.string)
        >> Result.mapError Error


{-| -}
showOpenDialog : Options -> Task Error (List String)
showOpenDialog options =
    LowLevel.showOpenDialog (optionsToValue options)
        |> Task.mapError Error.fromValue
        |> Task.andThen
            (listStringFromValue >> Result.unpack Task.fail Task.succeed)


{-| -}
showModalOpenDialog : BrowserWindow -> Options -> Task Error (List String)
showModalOpenDialog browserWindow options =
    LowLevel.showModalOpenDialog browserWindow (optionsToValue options)
        |> Task.mapError Error.fromValue
        |> Task.andThen
            (listStringFromValue >> Result.unpack Task.fail Task.succeed)

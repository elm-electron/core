module Electron.FileFilter
    exposing
        ( FileFilter
        , encodeValue
        )

{-| Electron FileFilter.

@docs FileFilter , encodeValue

-}

import Json.Encode as Encode


{-| -}
type alias FileFilter =
    { name : String
    , extensions : List String
    }


{-| -}
encodeValue : FileFilter -> Encode.Value
encodeValue { name, extensions } =
    Encode.object
        [ ( "name", Encode.string name )
        , ( "extensions", Encode.list <| List.map Encode.string extensions )
        ]

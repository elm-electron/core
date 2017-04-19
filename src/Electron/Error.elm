module Electron.Error
    exposing
        ( Error(..)
        , fromValue
        )

{-| Javascript Error.

@docs Error , fromValue

-}

import Json.Decode as Decode
import Result.Extra as Result


{-| -}
type Error
    = Error String


decoder : Decode.Decoder Error
decoder =
    Decode.map Error
        (Decode.field "message" Decode.string)


{-| -}
fromValue : Decode.Value -> Error
fromValue value =
    Decode.decodeValue decoder value
        |> Result.extract (\error -> Error error)

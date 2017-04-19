module Main exposing (main)

import Electron.App as App
import Electron.Error as Error exposing (Error)
import Result.Extra as Result
import Task


type Msg
    = TestComplete (Result Error ())


init : ( {}, Cmd Msg )
init =
    let
        m =
            Debug.log "Elm" "App"
    in
        {}
            ! [ Ok ()
                    |> Result.andThen
                        (\_ ->
                            let
                                m =
                                    Debug.log "Testing" "getPath"
                            in
                                App.getPath App.UserData
                                    |> Result.map
                                        (\path ->
                                            let
                                                m =
                                                    Debug.log "getPath" path
                                            in
                                                ()
                                        )
                        )
                    |> Result.unpack Task.fail Task.succeed
                    |> Task.attempt TestComplete
              ]


main : Program Never {} Msg
main =
    Platform.program
        { init = init
        , update =
            (\msg model ->
                let
                    m =
                        Debug.log "Elm" msg
                in
                    model ! []
            )
        , subscriptions = always Sub.none
        }

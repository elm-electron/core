module Main exposing (main)

import Electron.Remote as Remote
import Electron.Error as Error exposing (Error)
import Result.Extra as Result
import Task


type Msg
    = TestComplete (Result Error ())


init : ( {}, Cmd Msg )
init =
    let
        m =
            Debug.log "Elm" "Dialog"
    in
        {}
            ! [ Ok ()
                    |> Result.andThen
                        (\_ ->
                            let
                                m =
                                    Debug.log "Testing" "getCurrentWindow"
                            in
                                Remote.getCurrentWindow ()
                                    |> Result.map
                                        (\window ->
                                            let
                                                m =
                                                    Debug.log "getCurrentWindow" "ok"
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

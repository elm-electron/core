module Main exposing (main)

import Electron.Remote as Remote
import Electron.Error as Error exposing (Error)
import Task


type Msg
    = TestComplete (Result Error ())


init : ( {}, Cmd Msg )
init =
    let
        m =
            Debug.log "Remote" ""
    in
        {}
            ! [ let
                    m =
                        Debug.log "Testing" "getCurrentWindow"
                in
                    Remote.getCurrentWindow ()
                        |> (\window ->
                                let
                                    m =
                                        Debug.log "getCurrentWindow" "ok"
                                in
                                    Task.succeed ()
                           )
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
                        Debug.log "Remote" msg
                in
                    model ! []
            )
        , subscriptions = always Sub.none
        }

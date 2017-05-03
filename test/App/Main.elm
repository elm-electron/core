module Main exposing (main)

import Electron.App as App
import Electron.Error as Error exposing (Error)
import Task


type Msg
    = TestComplete (Result Error ())


init : ( {}, Cmd Msg )
init =
    let
        m =
            Debug.log "App" ""
    in
        {}
            ! [ let
                    m =
                        Debug.log "Testing" "getPath"
                in
                    App.getPath App.UserData
                        |> (\path ->
                                let
                                    m =
                                        Debug.log "getPath" path
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
                        Debug.log "App" msg
                in
                    model ! []
            )
        , subscriptions = always Sub.none
        }

module Main exposing (main)

import Electron.Dialog as Dialog
import Electron.Error as Error exposing (Error)
import Electron.Remote as Remote
import Task


type Msg
    = TestComplete (Result Error ())


init : ( {}, Cmd Msg )
init =
    let
        m =
            Debug.log "Dialog" ""
    in
        {}
            ! [ Task.succeed ()
                    |> Task.andThen
                        (\_ ->
                            let
                                m =
                                    Debug.log "Testing" "showOpenDialog"
                            in
                                Dialog.showOpenDialog Dialog.defaultOptions
                                    |> Task.map
                                        (\filePaths ->
                                            let
                                                m =
                                                    Debug.log "showOpenDialog" filePaths
                                            in
                                                ()
                                        )
                        )
                    |> Task.andThen
                        (\_ ->
                            let
                                m =
                                    Debug.log "Testing" "showModalOpenDialog"

                                browserWindow =
                                    Remote.getCurrentWindow ()
                            in
                                Dialog.showModalOpenDialog browserWindow Dialog.defaultOptions
                                    |> Task.map
                                        (\filePaths ->
                                            let
                                                m =
                                                    Debug.log "showModalOpenDialog" filePaths
                                            in
                                                ()
                                        )
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
                        Debug.log "Dialog" msg
                in
                    model ! []
            )
        , subscriptions = always Sub.none
        }

module Main exposing (main)

import Electron.Dialog as Dialog
import Electron.Error as Error exposing (Error)
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
            ! [ Task.succeed ()
                    |> Task.andThen
                        (\_ ->
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

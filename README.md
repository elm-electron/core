# Electron core

> Native bindings for Electron's core api's.


## install

You'll need [Grove](https://github.com/panosoft/elm-grove.git).

```
grove install electron-elm/core
```

_This package uses [elm-node/npm-scripts](https://github.com/elm-node/npm-scripts) for installation. Install them in your package for a better install experience._


# todo

- electron native bindings
    look for apis we may use
    open source


Renderer
- Dialog
    - [x] showOpenDialog
    - [-] showModalOpenDialog
    - [-] showSaveDialog
    - [-] showModalSaveDialog
    - [-] showMessageBox
    - [-] showModalMessageBox
    - [-] showErrorBox
    - [-] showModalErrorBox
- Remote
    - [x] getCurrentWindow
    - [-] getCurrentWebContents
- app
    - [x] getPath
- [-] Menu
- [-] MenuItem
- [-] WebContents

Main
- [-] BrowserWindow
- [-] autoUpdater
- [-] crashReporter

const { app, BrowserWindow } = require("electron")

app.on("ready", () => {
    const window = new BrowserWindow()
    window.webContents.openDevTools()
    const path = `file://${__dirname}/index.html`
    window.loadURL(path)
})

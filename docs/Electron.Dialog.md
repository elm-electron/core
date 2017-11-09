# Electron.Dialog

Native bindings for Electrons dialog module.

- [showOpenDialog](#showopendialog)
- [showModalOpenDialog](#showmodalopendialog)
- [defaultOptions](#defaultoptions)

### **showOpenDialog**
```elm
showOpenDialog : Electron.Dialog.Options -> Task Electron.Error.Error (List String)
```



---

### **showModalOpenDialog**
```elm
showModalOpenDialog : Electron.BrowserWindow.BrowserWindow -> Electron.Dialog.Options -> Task Electron.Error.Error (List String)
```



---

### **defaultOptions**
```elm
defaultOptions : Electron.Dialog.Options
```




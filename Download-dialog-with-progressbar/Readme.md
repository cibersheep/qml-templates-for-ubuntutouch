Use:
- Edit `property string dialogTitle i18n.tr("")` and `property string descriptionPrepend: i18n.tr("")` in qml file
- Add [downloadinterceptor](http://github.com/bhdouglass/downloadinterceptor) to the project
- Add `import Ubuntu.Components.Popups 1.3` to the main qml and call the download with `PopupUtils.open(downloadingDialog, [id of the page], { "fileName" : [name of the file or variable] })`

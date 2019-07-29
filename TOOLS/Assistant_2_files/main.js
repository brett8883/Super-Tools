'use strict'

const electron = require('electron')
const dialog = electron.dialog
const app = electron.app  // Module to control application life.
const BrowserWindow = electron.BrowserWindow  // Module to create native browser window.
const globalShortcut = electron.globalShortcut
const ipcMain = electron.ipcMain


var ishttpURL = function(url){
  if(/(http|ftp|https|file):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?/.test(url)){
    return true
  }
  return false
}

// EG: 'file://xxx/index.html/#view/xxx' will return 'index.html/#view'
var getRouteURL = function(url){
  var tmp = /[^/]*\.html#\/[^/]*/.exec(url)
  return tmp ? tmp[0] : url
}

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
var mainWindow = null
var locale = 'en'
var debug = process.argv[2]=='debug'?true:false

// Functions
var onCloseEvent = function(event){

  var self = this

  self.webContents.send('close-confirm', '')

  var msg = {
    'quit': {
      'en': 'Quit Now?',
      'zh-cn': '确定退出么？',
      'jp': 'やめるか？'
    },
    'ok': {
      'en': ' Yes ',
      'zh-cn': '是',
      'jp': 'はい'
    },
    'cancel': {
      'en': ' No ',
      'zh-cn': '否',
      'jp': 'いいえ'
    }
  }

  var choice = dialog.showMessageBox(self, {
      type: 'question',
      buttons: [
        msg['ok'][locale]?msg['ok'][locale]:msg['ok']['en'],
        msg['cancel'][locale]?msg['cancel'][locale]:msg['cancel']['en']
      ],
      title: 'DJI Assistant 2',
      message: msg['quit'][locale]?msg['quit'][locale]:msg['quit']['en'],
      noLink: true,
      cancelId: 2
  })

  if(choice !== 0){
    event.preventDefault()
    return false
  }

  self.webContents.send('close', '')

  // If user closing the main window, close all opened window.
  if(self == mainWindow){
    var windowset = BrowserWindow.getAllWindows()
    windowset.forEach(function(ele, idx){
      if(ele && ele.close && ele != mainWindow) ele.close()
    })
  }

}

// For Browser Plugins
app.commandLine.appendSwitch('ppapi-out-of-process','')
app.commandLine.appendSwitch('register-pepper-plugins', '../Browser/DJIViewerPlugin.dll;plugin/dji_viewer' + ', '
 + '../Browser/DJILiveVideoPlugin.dll;plugin/dji_live_video')

// Quit when all windows are closed.
app.on('window-all-closed', function(){
  // On OS X it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q

  // if(process.platform != 'darwin'){
    app.quit()
  // }
})

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
app.on('ready', function(){

  mainWindow = new BrowserWindow({
    width: 1080, height: 650, minWidth: 1080, minHeight: 650, useContentSize: true, title: 'DJI Assistant 2', backgroundColor: '#fff', autoHideMenuBar: true,
    'web-preferences': {
      'plugins': true
    }
  })
  if(!debug) mainWindow.setMenu(null)
  mainWindow.setMenuBarVisibility(false)
  mainWindow.loadURL('file://' + __dirname + '/app.asar/index.html')
  // Open the DevTools.
  mainWindow.webContents.openDevTools()


  mainWindow.on('close', onCloseEvent)


  // Emitted when the window is closed.
  mainWindow.on('closed', function(){
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    mainWindow = null
  })

})

ipcMain.on('asynchronous-message', function(event, arg){

  switch(arg.type){

    case 'openWindow':

      var opts = arg.options

      // Check whether window already exist
      var already_exist = false
      var windowset = BrowserWindow.getAllWindows()

      for(var i = windowset.length - 1; i >= 0; i--){
        var ele = windowset[i]
        if(ele && ele.webContents){

          var cur_url = ele.webContents.getURL()
          var go_url = ishttpURL(arg.url) ? arg.url : getRouteURL(arg.url)
          cur_url = ishttpURL(cur_url) ? cur_url : getRouteURL(cur_url)

          console.log('go_url',go_url)
          console.log('cur_url',cur_url)

          if(cur_url == go_url){
            already_exist = true
            ele.focus()
            break
          }

        }
      }

      if(already_exist) return false

      if(ishttpURL(arg.url)){
        var url = arg.url
        opts['node-integration'] = false
      }else{
        var url = 'file://' + __dirname + '/app.asar/' + arg.url
      }

      opts['web-preferences'] = {'plugins': true}

      var win = new BrowserWindow(opts)

      if(opts['needCloseConfirm']) win.on('close', onCloseEvent)

      win.on('closed', function(){
        win = null
      })

      if(!debug) win.setMenu(null)
      win.setMenuBarVisibility(false)
      win.loadURL(url)
      win.show()

      break

    default:
      break

  }

  event.sender.send('asynchronous-reply', 'success')

})

ipcMain.on('set-locale', function(event, arg){
  locale = arg
})
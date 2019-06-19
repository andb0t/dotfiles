# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
atom.commands.add '.tree-view', 'custom:expand-item-down': ->
  fs = require 'fs'
  item = atom.workspace.getActivePaneItem()
  atom.commands.dispatch(item.element, 'core:move-down')
  if fs.lstatSync(item.selectedPath).isDirectory()
    return
  else
    item.openSelectedEntry(pending: true, activatePane: false)
    return
atom.commands.add '.tree-view', 'custom:expand-item-up': ->
  fs = require 'fs'
  item = atom.workspace.getActivePaneItem()
  atom.commands.dispatch(item.element, 'core:move-up')
  if fs.lstatSync(item.selectedPath).isDirectory()
    return
  else
    item.openSelectedEntry(pending: true, activatePane: false)
    return

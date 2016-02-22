Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'googlesearch:google-it': => @convert()

  convert: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://encrypted.google.com/search?q=#{cased}&oq=#{cased}"
        Shell.openExternal url

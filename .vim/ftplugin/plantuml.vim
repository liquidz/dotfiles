if exists('g:loaded_plantuml_ftplugin')
  finish
endif
let g:loaded_plantuml_ftplugin = 1

aug MyPlantUMLSetting
  au!
  au FileType plantuml inoremap <buffer> >> ->
aug END

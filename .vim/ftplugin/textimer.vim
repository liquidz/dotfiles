" let g:textimer#finished_command = 'curl'
" let g:textimer#finished_exec = '%c -XPOST -H "Content-Type: application/json" localhost:8890/api -d ''{"action": "add-tile", "type": "text", "title": "Finished", "content": "Finished"}'''

" let g:textimer#finished_command = 'osascript'
" let g:textimer#finished_exec = '%c -e "display notification \"textimer\" with title \"%s\""'

"let g:textimer#finished_exec = '%c -XPOST -H "Content-Type: application/json" localhost:8890/api -d "{\"action\": \"set\", \"color\": \"#FFB11B\"}"'
"
let g:textimer#started_command = 'curl'
let g:textimer#started_exec = '%c -XPOST localhost:8890/F0908D/F43A'

let g:textimer#finished_command = 'curl'
let g:textimer#finished_exec = '%c -XPOST localhost:8890/38A1DB/F43A'

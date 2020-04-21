let g:textimer#finished_command = 'curl'
let g:textimer#finished_exec = '%c -XPOST -H "Content-Type: application/json" localhost:8890/api -d ''{"action": "add-tile", "type": "text", "content": "Finished"}'''

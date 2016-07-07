function! MyLgtm(username) abort
  let V = vital#of('vital')
  let Http = V.import('Web.HTTP')
  let Json = V.import('Web.JSON')
  let url  = printf('http://lgtm.in/g/%s', a:username)
  let body = Http.get(url, {}, {'Accept': 'application/json'})
  let json = Json.decode(body['content'])

  call setline(line('.'), json['imageUrl'])
endfunction

command! LGTM call MyLgtm('liquidz')

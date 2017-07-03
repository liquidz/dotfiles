import SimpleHTTPServer
import SocketServer
import mimetypes

PORT = 8000

Handler = SimpleHTTPServer.SimpleHTTPRequestHandler

Handler.extensions_map['.md']='text/plain;charset=UTF-8'
httpd = SocketServer.TCPServer(("", PORT), Handler)

print "serving at port", PORT
httpd.serve_forever()

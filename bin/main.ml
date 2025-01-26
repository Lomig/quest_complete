open Server

let () = Dream.run @@ Dream.logger @@ Dream.router Router.routes

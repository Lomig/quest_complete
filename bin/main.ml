open Server

let () = Dotenv.load ()

let () =
  Dream.run
  @@ Dream.logger
  @@ Dream.sql_pool (Sys.getenv "DATABASE_URL")
  @@ Dream.router Router.routes
;;

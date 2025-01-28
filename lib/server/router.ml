open Handlers

let routes =
  [ Dream.get "/static/**" (Dream.static "static"); Dream.get "/" Pages.homepage ]
;;

open Lwt.Syntax

module type DB = Caqti_lwt.CONNECTION

module T = Caqti_type

let query =
  let open Caqti_request.Infix in
  (T.unit ->! T.string) "SELECT title FROM games LIMIT 1"
;;

let first_game_title (module Db : DB) =
  let* record_and_error = Db.find query () in
  Caqti_lwt.or_fail record_and_error
;;

let homepage request =
  let* game_title = Dream.sql request first_game_title in
  Views.Pages.Homepage.render game_title |> Dream.html
;;

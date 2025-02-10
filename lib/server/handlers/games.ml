open Domain
open Lwt.Syntax

let show request =
  let id = Dream.param request "id" in
  let* game = Game.find_by_id ~request id in
  match game with
  | None -> Dream.empty `Not_Found
  | Some game -> game |> Views.Games.Show.render |> Dream.html
;;

let index request =
  let* games = Game.all ~request () in
  games |> Views.Games.Index.render |> Dream.html
;;

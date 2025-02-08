(*===========================================================================*
 * External Dependencies
 *===========================================================================*)
open Containers

(*===========================================================================*
 * Types
 *===========================================================================*)
type t =
  { id : string
  ; title : string
  ; platform : Platform.t
  ; genre : string
  ; release_date : Date.t
  ; igdb_id : int
  ; cover_url : string
  ; completion_date : Date.t
  ; rating : int option
  ; review : string option
  ; created_at : Ptime.t
  ; updated_at : Ptime.t
  }

(*===========================================================================*
 * Database Setup
 *===========================================================================*)
module DB = struct
  include Caqti_type.Std
  include Caqti_request.Infix

  module type Connection = Caqti_lwt.CONNECTION

  let t =
    let encode game =
      Ok
        ( game.id, game.title, Platform.to_string game.platform, game.genre
        , Date.to_iso game.release_date, game.igdb_id, game.cover_url
        , Date.to_iso game.completion_date, game.rating, game.review
        , game.created_at, game.updated_at )
    in
    let decode
          ( id, title, platform, genre, release_date, igdb_id, cover_url
          , completion_date, rating, review, created_at, updated_at )
      =
      Ok
        { id; title; platform = Platform.of_string platform; genre
        ; release_date = Result.get_or ~default:Date.zero @@ Date.of_iso release_date
        ; igdb_id; cover_url
        ; completion_date = Result.get_or ~default:Date.zero @@ Date.of_iso completion_date
        ; rating; review; created_at; updated_at
        }
    in
    custom
      ~encode
      ~decode
      (t12
         string string string string
         string int string string
         (option int) (option string) ptime ptime) [@@ ocamlformat "disable"]
end

(*===========================================================================*
 * Queries
 *===========================================================================*)
let find_by_id ~request id =
  let open DB in
  let open Lwt.Syntax in
  let query = (string ->? t) @@ "SELECT * FROM games WHERE id = ?" in
  let find_by_id' id =
    fun (module Db : Connection) ->
    let* game_option = Db.find_opt query id in
    Caqti_lwt.or_fail game_option
  in
  let* result = id |> find_by_id' |> Dream.sql request in
  Lwt.return result
;;

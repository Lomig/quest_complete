open Containers
open Domain

(*===========================================================================*
 * Game Index
 *===========================================================================*)
module IndexGameCardComponent = Components.MakeComponent (Components.Games.Card)

let index_data (games : Game.t list) : Templates.Games.Index.data =
  let games_data =
    List.map
      (fun (game : Game.t) : IndexGameCardComponent.data ->
         { uri = "/games/" ^ game.id
         ; title = game.title
         ; rating =
             (match game.rating with
              | None -> "N/A"
              | Some r -> string_of_int r)
         ; cover_url = game.cover_url
         })
      games
  in
  { card_components = IndexGameCardComponent.render_list ~tag:(Some "li") games_data }
;;

let index games =
  Templates.Layouts.Main.layout @@ Templates.Games.Index.render @@ index_data games
;;

(*===========================================================================*
 * Game Show
 *===========================================================================*)
let show_data (game : Game.t) : Templates.Games.Show.data =
  { title = game.title
  ; release_date = Date.to_short game.release_date
  ; rating =
      (match game.rating with
       | None -> "N/A"
       | Some r -> string_of_int r)
  ; platform = Platform.to_string game.platform
  ; genre = game.genre
  ; cover_url = game.cover_url
  ; completion_date = Date.to_long game.completion_date
  ; review = Option.get_or ~default:"Pas encore de critique" game.review
  }
;;

let show game =
  Templates.Layouts.Main.layout @@ Templates.Games.Show.render @@ show_data game
;;

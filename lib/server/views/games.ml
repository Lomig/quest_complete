open Containers
open Domain

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

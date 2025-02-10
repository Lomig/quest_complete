open Containers
open Domain
open Pure_html
open Pure_html.HTML
module IndexGameCardComponent = Components.MakeComponent (Components.Games.Card)

let extract_data_from (games : Game.t list) =
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
;;

let render games =
  Templates.Layouts.Main.layout
  @@ Templates.Games.Index.body
  @@ IndexGameCardComponent.node_list ~tag:(li [])
  @@ extract_data_from games
  |> to_string
;;

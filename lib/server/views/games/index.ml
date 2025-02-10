open Containers
open Domain
open Pure_html
open Pure_html.HTML
module GameCardComponent = Components.MakeComponent (Components.Games.Card)

let extract_data_from (games : Game.t list) =
  let component_of_game : Game.t -> GameCardComponent.data =
    fun game ->
    { uri = "/games/" ^ game.id
    ; title = game.title
    ; rating = Option.map_or ~default:"N/A" string_of_int game.rating
    ; cover_url = game.cover_url
    }
  in
  List.map component_of_game games
;;

let render games =
  let index_card_list =
    extract_data_from games |> GameCardComponent.node_list ~tag:(li [])
  in
  Layouts.Main.layout
    [ h1 [ class_ "text-red-800 text-4xl" ] [ txt "Mes jeux terminés" ]
    ; ul [] index_card_list
    ]
  |> to_string
;;

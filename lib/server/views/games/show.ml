open Containers
open Domain
open Pure_html
open Pure_html.HTML

type data =
  { title : string
  ; release_date : string
  ; rating : string
  ; platform : string
  ; genre : string
  ; cover_url : string
  ; completion_date : string
  ; review : string
  }

let extract_data_from (game : Game.t) =
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

let render game =
  let data = extract_data_from game in
  Layouts.Main.layout
    [ h1
        [ class_ "text-red-800 text-4xl"; string_attr "data-controller" "hello-world" ]
        [ txt "%s" data.title ]
    ; img [ src "%s" data.cover_url; alt "%s" data.title; class_ "w-1/4" ]
    ; ul
        []
        [ li [] [ txt "Genre : %s" data.genre ]
        ; li [] [ txt "Date de sortie : %s" data.release_date ]
        ; li [] [ txt "Plateforme : %s" data.platform ]
        ]
    ; br []
    ; br []
    ; p [ class_ "text-bold" ] [ txt "Complété le %s" data.completion_date; txt " !" ]
    ; a [ href "/games" ] [ txt "Back" ]
    ]
  |> to_string
;;

open Containers
open Pure_html
open Pure_html.HTML

let render title =
  Layouts.Main.layout
    [ h1 [ class_ "text-green-800" ] [ txt "My First Game" ]
    ; p [] [ txt "%s" title ]
    ; a [ href "/games" ] [ txt "Games" ]
    ]
  |> to_string
;;

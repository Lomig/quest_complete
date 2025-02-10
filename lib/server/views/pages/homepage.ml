open Containers
open Pure_html
open Pure_html.HTML

let render (user : Domain.User.t option) =
  let nickname =
    match user with
    | Some user -> Option.get_or ~default:user.first_name user.nickname
    | None -> "Anonymous"
  in
  Layouts.Main.layout
    [ h1 [ class_ "text-green-800" ] [ txt "My First Game" ]
    ; p [] [ txt "%s" nickname ]
    ; a [ href "/games" ] [ txt "Games" ]
    ]
  |> to_string
;;

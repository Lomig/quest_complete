open Pure_html
open HTML

let body title =
  [ h1 [ class_ "text-red-400" ] [ txt "My First Game" ]; p [] [ txt "%s" title ] ]
;;

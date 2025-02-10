open Pure_html
open HTML

type data = node list

let body data =
  [ h1 [ class_ "text-red-800 text-4xl" ] [ txt "Mes jeux terminés" ]; ul [] data ]
;;

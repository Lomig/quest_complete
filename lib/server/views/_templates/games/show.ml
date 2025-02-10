open Pure_html
open HTML

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

let body data =
  [ h1 [ class_ "text-red-800 text-4xl" ] [ txt "%s" data.title ]
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
;;

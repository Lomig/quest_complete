open Pure_html
open HTML

type data =
  { uri : string
  ; title : string
  ; rating : string
  ; cover_url : string
  }

let node data =
  a
    [ href "%s" data.uri; class_ "flex items-center" ]
    [ img [ src "%s" data.cover_url; alt "%s" data.title; class_ "w-1/4" ]
    ; div [] [ txt "%s" data.title ]
    ; div [] [ txt "%s" data.rating ]
    ]
;;

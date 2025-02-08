type t =
  | PC
  | PS5
  | PS4
  | XboxXS
  | XboxOne
  | Switch
  | Mobile
  | Other

let of_string = function
  | "PC" -> PC
  | "PlayStation 5" -> PS5
  | "PlayStation 4" -> PS4
  | "Xbox Series X/S" -> XboxXS
  | "Xbox One" -> XboxOne
  | "Nintendo Switch" -> Switch
  | "Mobile" -> Mobile
  | _ -> Other
;;

let to_string = function
  | PC -> "PC"
  | PS5 -> "PlayStation 5"
  | PS4 -> "PlayStation 4"
  | XboxXS -> "Xbox Series X/S"
  | XboxOne -> "Xbox One"
  | Switch -> "Nintendo Switch"
  | Mobile -> "Mobile"
  | Other -> "Autre"
;;

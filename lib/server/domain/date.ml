open Containers

type day = int
type year = int

type week_day =
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday

let string_of_week_day = function
  | Monday -> "Lundi"
  | Tuesday -> "Mardi"
  | Wednesday -> "Mercredi"
  | Thursday -> "Jeudi"
  | Friday -> "Vendredi"
  | Saturday -> "Samedi"
  | Sunday -> "Dimanche"
;;

let int_of_week_day : week_day -> int = function
  | Monday -> 1
  | Tuesday -> 2
  | Wednesday -> 3
  | Thursday -> 4
  | Friday -> 5
  | Saturday -> 6
  | Sunday -> 7
;;

let rec week_day_of_int : int -> week_day = function
  | 1 -> Monday
  | 2 -> Tuesday
  | 3 -> Wednesday
  | 4 -> Thursday
  | 5 -> Friday
  | 6 -> Saturday
  | 7 -> Sunday
  | (n : int) -> week_day_of_int ((n mod 7) + 1)
;;

type month =
  | January
  | February
  | March
  | April
  | May
  | June
  | July
  | August
  | September
  | October
  | November
  | December

let string_of_month = function
  | January -> "Janvier"
  | February -> "Février"
  | March -> "Mars"
  | April -> "Avril"
  | May -> "Mai"
  | June -> "Juin"
  | July -> "Juillet"
  | August -> "Août"
  | September -> "Septembre"
  | October -> "Octobre"
  | November -> "Novembre"
  | December -> "Décembre"
;;

let int_of_month : month -> int = function
  | January -> 1
  | February -> 2
  | March -> 3
  | April -> 4
  | May -> 5
  | June -> 6
  | July -> 7
  | August -> 8
  | September -> 9
  | October -> 10
  | November -> 11
  | December -> 12
;;

let rec month_of_int : int -> month = function
  | 1 -> January
  | 2 -> February
  | 3 -> March
  | 4 -> April
  | 5 -> May
  | 6 -> June
  | 7 -> July
  | 8 -> August
  | 9 -> September
  | 10 -> October
  | 11 -> November
  | 12 -> December
  | (n : int) -> month_of_int ((n mod 12) + 1)
;;

type t =
  { day : day
  ; month : month
  ; year : year
  }

let day_of_the_week { day; month; year } =
  let m = int_of_month month in
  let y = if m < 3 then year - 1 else year in
  (y + (y / 4) - (y / 100) + (y / 400) + int_of_char "-bed=pen+mad".[m] + day) mod 7
  |> week_day_of_int
;;

let to_string { day; month; year } =
  Format.sprintf "%d %s %d" day (string_of_month month) year
;;

let to_short { day; month; year } =
  Format.sprintf "%02d/%02d/%d" day (int_of_month month) year
;;

let to_long date =
  Format.sprintf
    "%s %d %s %d"
    (date |> day_of_the_week |> string_of_week_day)
    date.day
    (string_of_month date.month)
    date.year
;;

let to_iso { day; month; year } =
  Format.sprintf "%d-%02d-%02d" year (int_of_month month) day
;;

let of_iso date =
  match String.to_list date with
  | [ y1; y2; y3; y4; '-'; m1; m2; '-'; d1; d2 ] ->
    let year =
      ((int_of_char y1 - 48) * 1000)
      + ((int_of_char y2 - 48) * 100)
      + ((int_of_char y3 - 48) * 10)
      + (int_of_char y4 - 48)
    in
    let month = month_of_int (((int_of_char m1 - 48) * 10) + (int_of_char m2 - 48)) in
    let day = ((int_of_char d1 - 48) * 10) + (int_of_char d2 - 48) in
    Ok { day; month; year }
  | _ -> Error "Invalid ISO date format"
;;

let is_leap_year : year -> bool =
  fun year -> year mod 400 = 0 || (year mod 4 = 0 && year mod 100 <> 0)
;;

let days_in_month : year -> month -> int =
  fun year -> function
  | January -> 31
  | February -> if is_leap_year year then 29 else 28
  | March -> 31
  | April -> 30
  | May -> 31
  | June -> 30
  | July -> 31
  | August -> 31
  | September -> 30
  | October -> 31
  | November -> 30
  | December -> 31
;;

let days_in_year : year -> int = function
  | year when is_leap_year year -> 366
  | _ -> 365
;;

let zero = { day = 1; month = January; year = 1970 }

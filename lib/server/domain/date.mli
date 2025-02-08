type day
type year

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

type t =
  { day : day
  ; month : month
  ; year : year
  }

type week_day =
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday

val string_of_week_day : week_day -> string
val int_of_week_day : week_day -> int
val week_day_of_int : int -> week_day
val string_of_month : month -> string
val int_of_month : month -> int
val month_of_int : int -> month
val day_of_the_week : t -> week_day
val to_string : t -> string
val to_short : t -> string
val to_long : t -> string
val to_iso : t -> string
val of_iso : string -> (t, string) result
val is_leap_year : year -> bool
val days_in_month : year -> month -> int
val days_in_year : year -> int
val zero : t

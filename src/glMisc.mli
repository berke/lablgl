(* $Id: glMisc.mli,v 1.3 2003-04-22 03:24:02 erickt Exp $ *)

(* Getting information *)
val get_string : [`vendor|`renderer|`version|`extensions] -> string


(* Clipping planes *)
type equation = float * float * float * float
val clip_plane : plane:int -> equation -> unit

(* Speed hint *)
type hint_target =
    [`fog|`line_smooth|`perspective_correction|`point_smooth|`polygon_smooth]
val hint : hint_target -> [`fastest|`nicest|`dont_care] -> unit

(* Names *)
val init_names : unit -> unit
val load_name : int -> unit
val push_name : int -> unit
val pop_name : unit -> unit

type attrib =
    [ `accum_buffer|`color_buffer|`current|`depth_buffer|`enable|`eval|`fog
    | `hint|`lighting|`line|`list|`pixel_mode|`point|`polygon|`polygon_stipple
    | `scissor|`stencil_buffer|`texture|`transform|`viewport ]
val push_attrib : attrib list -> unit
val pop_attrib : unit -> unit

val render_mode : [`feedback|`render|`select] -> int
val pass_through : float -> unit
val select_buffer : [`uint] Raw.t -> unit

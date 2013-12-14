(* vdc.m -- van der Corput script *)
(* Copyright (C) 2013  SheetJS *)
(* vim: set ft=mma: *)
(* Usage: math -script vdc.m <dispdigits> <base> <nelts> *)

(* read arguments from command line *)
argdigs=ToExpression[$CommandLine[[-3]]];
argbase=ToExpression[$CommandLine[[-2]]];
argelts=ToExpression[$CommandLine[[-1]]];
d={argdigs,argdigs};

(*
  van der Corput sequence generation in mathematica:
  http://reference.wolfram.com/mathematica/CUDALink/tutorial/Applications.html

  this function returns a table of the form
  [iteration, fraction]   
*)
VanDerCorput[base_][len_]:=Table[
  {n, With[{digits = Reverse@IntegerDigits[n, base]}, 
    N[Sum[argbase^(-ii)*digits[[ii]], {ii, Length[digits]}],d]]}, {n, len}];

(* print table form *)
data=VanDerCorput[argbase][argelts];
Print[Grid[data]//OutputForm]

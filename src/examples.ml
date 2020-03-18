open Absyn

(*
  altura := 173
 *)

let prog1 = AssignStm ("altura", NumExp 173)


(*
  print(43, 7, 0)
 *)

let prog2 = PrintStm [NumExp 43; NumExp 7; NumExp 0]


(*
  x := 2 + 3;
  print(x)
 *)

let prog3 =
  CompoundStm (AssignStm ("x", OpExp (NumExp 2, Plus, NumExp 3)),
               PrintStm [IdExp "x"])


(*
  x := 2 + 3 * 4;
  print(x)

 *)

let prog4 =
  CompoundStm (AssignStm ("x",
                          OpExp (NumExp 2,
                                 Plus,
                                 OpExp (NumExp 3,
                                        Times,
                                        NumExp 4))),
               PrintStm [IdExp "x"])


(*
  a := 5 + 3;
  b := (print(a, a-1), 10*a);
  print(b)
 *)

let prog5 = CompoundStm ( AssignStm ("a", OpExp (NumExp 5, Plus, NumExp 3)),
                          CompoundStm ( AssignStm ("b",
                                                    EseqExp( PrintStm [IdExp "a";
                                                                        OpExp (IdExp "a", Minus, NumExp 1)],
                                                              OpExp (NumExp 10, Times, IdExp "a"))),
                                        PrintStm [IdExp "b"]))

(*
  read(v);
  print(v)
*)
let prog6 = CompoundStm (ReadStm "x", 
                        PrintStm [IdExp "x"])

(*
  if (read(v), v) then
    print(1)
  else
    print(0)
*)
let prog7 = IfStm (EseqExp (ReadStm "v", IdExp "v"),
                    PrintStm [NumExp 1],
                    PrintStm [NumExp 0])

(*
  while (read(v), v) do print v
*)
let pro8 = WhileStm (EseqExp (ReadStm "v", IdExp "v"),
                    PrintStm [IdExp "v"])

(*
  v := 9;
  while v do begin
    print(v);
    v := v - 1
  end
*)
let prog9 = CompoundStm ( AssignStm ("v", NumExp 9),
                          WhileStm ((IdExp "v"),
                                    CompoundStm (PrintStm [IdExp "v"],
                                                  AssignStm ("v",
                                                              OpExp (IdExp "v",
                                                                      Minus,
                                                                      NumExp 1)))))

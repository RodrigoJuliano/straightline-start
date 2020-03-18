open Absyn
open Interpreter
open Maxargs

(*

  read(v);
  if v then
    r := v - 1;
    while r do begin
      v := v * r
      r := r - 1;
    end
  else
    v := 1
  print(v)

*)


let fat = CompoundStm ( ReadStm "v",
                        CompoundStm ( IfStm (IdExp "v",
                                              CompoundStm ( AssignStm ("r", OpExp (IdExp "v", Minus, NumExp 1)),
                                                            WhileStm (IdExp "r",
                                                                      CompoundStm ( AssignStm ("v", OpExp (IdExp "v", Times, IdExp "r")),
                                                                                    AssignStm ("r", OpExp (IdExp "r", Minus, NumExp 1))))),
                                              AssignStm ("v", NumExp 1)),
                                      PrintStm [IdExp "v"]))

(* Main *)
let _ = print_int (Maxargs.maxargs fat);
        print_newline ();
        Interpreter.interpret fat
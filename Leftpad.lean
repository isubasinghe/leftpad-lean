import Aesop
def leftpad (l: List α) (a: α) (n: Nat) : List α := (List.replicate n a) ++ l


def drop (l: List α) (n: Nat): Option (List α) := 
  if n == 0 then 
    some l 
  else 
    match l with 
    | [] => none 
    | _::xs => drop xs (n-1)

#eval drop [1, 2] 1

@[simp]
theorem drop_leftpad_eq_orig (l: List α) (a: α) (n: Nat): drop (leftpad l a n) n = l := by sorry


theorem nil_append (l: List Nat): l ++ [] ++ l  ++ [2]= l ++ l ++ [2] := by 
  simp





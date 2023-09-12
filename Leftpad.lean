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


theorem drop_leftpad_eq_orig (l: List α) (a: α) (n: Nat): drop (leftpad l a n) n = l := by
  induction n with
  | zero => 
    simp
    rw [leftpad]
    simp
    unfold drop
    simp
  | succ z iz => 
    rw [<-Nat.add_one]
    rw [<-iz]
    rfl

theorem take_repl_eq_repl (a: α) (n: Nat): (List.replicate n a).take n = List.replicate n a := by
  induction n with 
  | zero => 
    simp
  | succ z iz => 
    simp
    rw [iz] 

theorem take_leftpad_eq_padded (l: List α) (a: α) (n: Nat):(leftpad l a n).take n = List.replicate n a := by
induction n with
| zero =>
  simp
| succ z iz => 
  rw [<-Nat.add_one]
  simp
  rw [<-leftpad]
  rw [iz]


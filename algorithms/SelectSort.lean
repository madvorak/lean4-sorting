import TestingData

variable {α : Type} [LE α] [@DecidableRel α (. ≤ .)]

private def minToLeft : List α → List α
| []          => []
| [s]         => [s]
| x :: y :: r => match minToLeft (y :: r) with
  | []     => [x]
  | d :: l => if x ≤ d
              then x :: d :: l
              else d :: x :: l

partial def selektSort (l : List α) : List α :=
match minToLeft l with
  | []     => []
  | x :: r => x :: selektSort r

#eval selektSort ciphers
#eval selektSort diamond
#eval selektSort hourglass
#eval selektSort twenty
#eval selektSort twenty = List.map (. + 1) (List.range 20)
#eval selektSort center
#eval selektSort center = List.map (λ n : Nat => (n : Int) - 10) (List.range 21)
#eval selektSort alphabet

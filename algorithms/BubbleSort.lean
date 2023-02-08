import TestingData

variable {α : Type} [LE α] [@DecidableRel α (. ≤ .)]

private def bubl : List α → List α × Bool
| []          => ([], false)
| [s]         => ([s], false)
| x :: y :: r => if x ≤ y
                 then let (l, b) := bubl (y :: r) ; (x :: l, b)
                 else (y :: (bubl (x :: r)).1, true)

partial def bublSort (l : List α) : List α :=
let (l', b) := bubl l
if b then bublSort l' else l'

#eval bublSort ciphers
#eval bublSort diamond
#eval bublSort hourglass
#eval bublSort twenty
#eval bublSort twenty = List.map (. + 1) (List.range 20)
#eval bublSort center
#eval bublSort center = List.map (λ n : Nat => (n : Int) - 10) (List.range 21)
#eval bublSort alphabet

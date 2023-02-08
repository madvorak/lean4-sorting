import TestingData

variable {α : Type} [LE α] [@DecidableRel α (. ≤ .)]

private def insrt (a : α) : List α → List α
| []     => [a]
| d :: l => if a ≤ d
            then a :: d :: l
            else d :: insrt a l

def insrtSort : List α → List α
| []     => []
| d :: l => insrt d (insrtSort l)

#eval insrtSort ciphers
#eval insrtSort diamond
#eval insrtSort hourglass
#eval insrtSort twenty
#eval insrtSort twenty = List.map (. + 1) (List.range 20)
#eval insrtSort center
#eval insrtSort center = List.map (λ n : Nat => (n : Int) - 10) (List.range 21)
#eval insrtSort alphabet

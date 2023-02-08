import TestingData

variable {α : Type} [LE α] [@DecidableRel α (. ≤ .)]

partial def qickSort : List α → List α
| []     => []
| p :: l => qickSort (l.filter (. ≤ p)) ++ [p] ++ qickSort (l.filter (λ a => ¬ (a ≤ p)))

#eval qickSort ciphers
#eval qickSort diamond
#eval qickSort hourglass
#eval qickSort twenty
#eval qickSort twenty = List.map (. + 1) (List.range 20)
#eval qickSort center
#eval qickSort center = List.map (λ n : Nat => (n : Int) - 10) (List.range 21)
#eval qickSort alphabet

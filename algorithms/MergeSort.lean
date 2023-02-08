import TestingData

variable {α : Type} [LE α] [@DecidableRel α (. ≤ .)]

private def halv : List α → List α × List α
| []          => ([], [])
| [s]         => ([s], [])
| a :: b :: l => let (x, y) := halv l ; (a :: x, b :: y)

private partial def merg : List α → List α → List α
| [],     l      => l
| l,      []     => l
| a :: x, b :: y => if a ≤ b
                    then a :: merg x (b :: y)
                    else b :: merg (a :: x) y

partial def mergSort : List α → List α
| []  => []
| [s] => [s]
| l   => let (x, y) := halv l
         merg (mergSort x) (mergSort y)

#eval mergSort ciphers
#eval mergSort diamond
#eval mergSort hourglass
#eval mergSort twenty
#eval mergSort twenty = List.map (. + 1) (List.range 20)
#eval mergSort center
#eval mergSort center = List.map (λ n : Nat => (n : Int) - 10) (List.range 21)
#eval mergSort alphabet

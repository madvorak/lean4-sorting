import TestingData

variable {α : Type} [LE α] [@DecidableRel α (. ≤ .)]

private def bubl : List α → List α
| []          => []
| [s]         => [s]
| x :: y :: r => match bubl (y :: r) with
  | []     => [x]
  | d :: l => if x ≤ d
              then x :: d :: l
              else d :: x :: l

partial def bublSort (l : List α) : List α :=
match bubl l with
  | []     => []
  | x :: r => x :: bublSort r
-- this is almost SelectSort

private def bubb : List α → List α
| []          => []
| [s]         => [s]
| x :: y :: r => if x ≤ y
                 then x :: bubb (y :: r)
                 else y :: bubb (x :: r)

def bubbSort : List α → List α
| []     => []
| d :: l => bubb (d :: bubbSort l)
-- this is almost InsertSort

private def babl : List α → List α × Bool
| []          => ([], false)
| [s]         => ([s], false)
| x :: y :: r => if x ≤ y
                 then let (l, b) := babl (y :: r) ; (x :: l, b)
                 else (y :: (babl (x :: r)).1, true)

partial def bablSort (l : List α) : List α :=
let (l', b) := babl l
if b then bablSort l' else l'

#eval bublSort ciphers
#eval bubbSort ciphers
#eval bablSort ciphers
#eval bublSort diamond
#eval bubbSort diamond
#eval bablSort diamond
#eval bublSort hourglass
#eval bubbSort hourglass
#eval bablSort hourglass
#eval bublSort twenty
#eval bubbSort twenty
#eval bablSort twenty
#eval bublSort center
#eval bubbSort center
#eval bablSort center
#eval bublSort alphabet
#eval bubbSort alphabet
#eval bablSort alphabet

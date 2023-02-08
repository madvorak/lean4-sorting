
def main : IO Unit := do
  let numbr <- IO.rand 0 99
  IO.println s!"{numbr}"

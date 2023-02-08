import Lake
open Lake DSL

package sorting {
}

lean_lib TestingData {
}

lean_lib algorithms.InsertSort {
}

@[defaultTarget]
lean_exe sorting {
  root := `Main
}

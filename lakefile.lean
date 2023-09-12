import Lake
open Lake DSL
package «leftpad» {
  -- add package configuration options here
}

lean_lib «Leftpad» {
  -- add library configuration options here
}

@[default_target]
lean_exe «leftpad» {
  root := `Main
}

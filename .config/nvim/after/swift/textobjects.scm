((string_literal) @string.outer
 . (_) @string.inner)

((parameter) @parameter.outer
 . (_) @parameter.inner)

((block) @block.outer
 . (_) @block.inner)

((function_declaration) @function.outer
 . (_) @function.inner)

((for_in_statement) @loop.outer
 . (_) @loop.inner)

((array_literal) @array.outer
 . (_) @array.inner)

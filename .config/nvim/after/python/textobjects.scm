((string) @string.outer
 . (_) @string.inner)

((parameters) @parameter.outer
 . (_) @parameter.inner)

((block) @block.outer
 . (_) @block.inner)

((function_definition) @function.outer
 . (_) @function.inner)

((for_statement) @loop.outer
 . (_) @loop.inner)

((while_statement) @loop.outer
 . (_) @loop.inner)

((list) @array.outer
 . (_) @array.inner)

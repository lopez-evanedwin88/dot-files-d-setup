((string_literal) @string.outer
 . (_) @string.inner)

((parameter) @parameter.outer
 . (_) @parameter.inner)

((statement_block) @block.outer
 . (_) @block.inner)

((function_declaration) @function.outer
 . (_) @function.inner)

((arrow_function) @function.outer
 . (_) @function.inner)

((for_statement) @loop.outer
 . (_) @loop.inner)

((while_statement) @loop.outer
 . (_) @loop.inner)

((array) @array.outer
 . (_) @array.inner)

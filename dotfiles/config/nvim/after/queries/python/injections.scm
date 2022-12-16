; extends

(assignment 
  left: (identifier) @_id (#match? @_id "sql")
  right: [
    (string) @sql
    (binary_operator
        left: (string) @sql
        right: (parenthesized_expression)
    )
  ]
)


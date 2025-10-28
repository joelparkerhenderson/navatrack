# IO.inspect

IO.inspect examples for a typical Elixir Phoenix Ash form:

```elixir
# Print all errors
IO.inspect(form.errors, label: "Form errors")

# Print Ash built-in error formatting
IO.inspect(AshPhoenix.Form.errors(form), label: "Changeset errors")

# Print the full form for debugging
IO.inspect(form, label: "Full form")

IO.inspect(form.source.params, label: "form.source.params (before processing)")
IO.inspect(form.params, label: "form.params (after processing)")
```

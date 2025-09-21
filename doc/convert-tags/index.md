# Convert tags

Edit file `lib/navatrack_web/components/core_components.ex`.

Add function:

```elixir
@doc """
Translates the errors for a field from a keyword list of errors.
"""
def translate_errors(errors, field) when is_list(errors) do
  for {^field, {msg, opts}} <- errors, do: translate_error({msg, opts})
end

@doc """
Convert tags param:
  - parse from a string into a list.
  - identity fallthrough.
"""

def convert_tags_param(%{"tags" => tags} = params) when is_binary(tags) do
  # Convert comma-separated string to list if your schema expects an array
  tags =
    tags
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))

  %{params | "tags" => tags}
end

def convert_tags_param(params), do: params
```

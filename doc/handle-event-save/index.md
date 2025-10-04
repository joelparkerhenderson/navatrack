# Handle event "save"

Edit each file `form_live.ex`.

Create a function to save the resource.

```elixir
def handle_event("save", %{"form" => form_data}, socket) do
  # form_data = convert_tags_param(form_data)
  case AshPhoenix.Form.submit(socket.assigns.form, params: form_data) do
    {:ok, x} ->
      {:noreply,
        socket
        |> put_flash(:info, "Saved.")
        |> push_navigate(to: path_show(x))
      }

    {:error, form} ->
      # Print all errors
      IO.inspect(form.errors, label: "Form errors")

      # Print Ash built-in error formatting
      IO.inspect(AshPhoenix.Form.errors(form), label: "Changeset errors")

      # Print the full form for debugging
      IO.inspect(form, label: "Full form")

      IO.inspect(form.source.params, label: "form.source.params (before processing)")
      IO.inspect(form.params, label: "form.params (after processing)")

      {:noreply,
        socket
        |> put_flash(:error, "Save failed.")
        |> assign(:form, form)
    }

  end
end
```

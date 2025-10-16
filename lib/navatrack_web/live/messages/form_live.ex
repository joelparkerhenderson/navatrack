defmodule NavatrackWeb.Messages.FormLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Message, as: X

  require Logger

  @doc """
  Mount the LiveView:
  - Update an item via an item id.
  - Create a new item.
  """

  def mount(%{"id" => id}, _session, socket) do
    form = AshPhoenix.Form.for_action(X, :update, domain: Navatrack.Works)
    users = Navatrack.Accounts.User |> Ash.read!()
    user_options = Enum.map(users, fn user ->
      {user.email, user.id}
    end)
    x = Ash.get!(X, id)

    {:ok,
     assign(socket,
       page_title: "Edit #{X.title_case_singular()}",
       form: to_form(form),
       user_options: user_options,
       x: x
     )}
  end

  def mount(_params, _session, socket) do
    form = AshPhoenix.Form.for_create(X, :create)
    users = Navatrack.Accounts.User |> Ash.read!()
    user_options = Enum.map(users, fn user ->
      {user.email, user.id}
    end)

    {:ok,
     assign(socket,
       page_title: "New #{X.title_case_singular()}",
       form: to_form(form),
       user_options: user_options
     )}
  end

  @doc """
  Render.
  """
  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.header>
        {@page_title}
      </.header>

      <.form
        :let={form}
        id="x_form"
        for={@form}
        as={:form}
        phx-change="validate"
        phx-submit="save"
      >
        <h2 class="h2">Introduction</h2>

        <.input
          field={form[:name]}
          label="📛 Name"
          autofocus
        />
        <.input
          field={form[:sign]}
          label="🚦 Sign"
        />
        <.input
          field={form[:status]}
          label="📍 Status"
        />
        <.input
          field={form[:tagging]}
          label="🏷️ Tags"
        />
        <.input
          field={form[:note]}
          label="🗒️ Note"
        />

        <.input
          field={@form[:writer_as_user_id]}
          type="select"
          label="Writer"
          options={@user_options}
          prompt="Select a writer"
        />

        <.input
          field={@form[:reader_as_user_id]}
          type="select"
          label="Reader"
          options={@user_options}
          prompt="Select a reader"
        />

        <.button type="primary">Save</.button>
      </.form>
    </Layouts.app>
    """
  end

  @doc """
  Handle event:
    - update now to try to work around DaisyUI collapse bug
    - validate form data
    - save form data to the database
  """

  def handle_event("updater", _params, socket) do
    IO.inspect("handle_event updater")
    {:noreply, socket}
  end

  def handle_event("validate", %{"form" => form_data}, socket) do
    # form_data = convert_tags_param(form_data)
    {:noreply,
     update(
       socket,
       :form,
       fn form -> AshPhoenix.Form.validate(form, form_data) end
     )}
  end

  def handle_event("save", %{"form" => form_data}, socket) do
    # form_data = convert_tags_param(form_data)
    IO.inspect(form_data, label: "form_data")

    changeset =
      Navatrack.Works.Message
      |> Ash.Changeset.for_create(:create, form_data)

    IO.inspect(changeset.attributes, label: "Changeset attributes")
    IO.inspect(changeset.errors, label: "Changeset errors")

    case AshPhoenix.Form.submit(socket.assigns.form, params: form_data) do
      {:ok, _x} ->
        {:noreply,
         socket
         |> put_flash(:info, "Saved.")
         |> push_navigate(to: path_index(X))}

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
         |> assign(:form, form)}
    end
  end
end

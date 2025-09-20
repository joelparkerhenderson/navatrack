defmodule NavatrackWeb.Skills.FormLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Accounts.User, as: X
  @singular "Skill"

  require Logger

  @doc """
  Mount the LiveView:
  - Update an item via an item id.
  - Create a new item.
  """

  def mount(%{"id" => id}, _session, socket) do
    form = AshPhoenix.Form.for_create(X, :edit)
    x = Ash.get!(X, id)

    {:ok, assign(socket,
      page_title: "Update #{X.title_singular}",
      form: to_form(form),
      x: x
    )}
  end

  def mount(_params, _session, socket) do
    form = AshPhoenix.Form.for_create(X, :create)

    {:ok, assign(socket,
      page_title: "Create #{X.title_singular}",
      form: to_form(form)
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

        <.input field={form[:title]} label="Name" autofocus />
        <.input field={form[:status]} label="Status" />
        <.input
          field={form[:tags]}
          label="Tags"
          value={
            case @form[:tags].value do
              tags when is_list(tags) -> tags
              tags when is_binary(tags) -> [tags]
              _ -> ""
            end
          }
        />

        <.section id="details" title="Details">
          <.input field={form[:summary_as_markdown]} label="Summary" />
          <.input field={form[:description_as_markdown]} label="Description" />
        </.section>

        <.section id="images" title="Images">

          <h3 class="h3">Avatar 400x400</h3>

          <.input field={form[:avatar_400x400_url]} label="URL" placeholder="https://example.com" />
          <.input field={form[:avatar_400x400_alt]} label="Alt" />

          <h3 class="h3">Splash 1080x1080 square</h3>

          <.input field={form[:splash_1080x1080_url]} label="URL" placeholder="https://example.com" />
          <.input field={form[:splash_1080x1080_alt]} label="Alt" />

          <h3 class="h3">Splash 1920x1080 landscape</h3>

          <.input field={form[:splash_1920x1080_url]} label="URL" placeholder="https://example.com" />
          <.input field={form[:splash_1920x1080_alt]} label="Alt" />

          <h3 class="h3">Splash 1920x1080 portrait</h3>

          <.input field={form[:splash_1080x1920_url]} label="URL" placeholder="https://example.com" />
          <.input field={form[:splash_1080x1920_alt]} label="Alt" />

        </.section>

        <.button type="primary">Save</.button>
      </.form>
    </Layouts.app>
    """
  end

  @doc """
  Render a form section using a DaisyUI collapse UI/UX to save screen spaces.
  The function uses a section id, section title, and section inner block.
  """

  attr :id, :string, required: true
  attr :title, :string, required: true
  slot :inner_block, required: true

  def section(assigns) do
    ~H"""
    <section id={"section_#{@id}"} class="collapse collapse-arrow bg-base-100 border border-base-300 my-4" phx-update="ignore">
      <input id={"section_#{@id}_input"} type="checkbox" class="collapse-toggle" />
      <div class="collapse-title">{@title}</div>
      <div class="collapse-content">
        <%= render_slot(@inner_block) %>
      </div>
    </section>
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
    form_data = convert_tags_param(form_data)

    {:noreply,
      update(
          socket,
          :form,
          fn form -> AshPhoenix.Form.validate(form, form_data)
      end)
    }
  end

  def handle_event("save", %{"form" => form_data}, socket) do
    form_data = convert_tags_param(form_data)
    case AshPhoenix.Form.submit(socket.assigns.form, params: form_data) do
      {:ok, x} ->
        {:noreply,
          socket
          |> put_flash(:info, "Saved.")
          |> push_navigate(to: ~p"/skills/#{x}")
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

end

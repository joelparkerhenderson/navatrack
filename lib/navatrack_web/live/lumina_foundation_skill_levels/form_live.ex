defmodule NavatrackWeb.LuminaFoundationSkillLevels.FormLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.LuminaFoundationSkillLevel, as: X

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
      page_title: "Update #{X.singular_title_case}",
      form: to_form(form),
      x: x
    )}
  end

  def mount(_params, _session, socket) do
    form = AshPhoenix.Form.for_create(X, :create)

    {:ok, assign(socket,
      page_title: "Create #{X.singular_title_case}",
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

        <.input field={form[:number]} label="Number (1-7)" autofocus />
        <.input field={form[:title]} label="Title" />
        <.input field={form[:description]} label="Description" />

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
          |> push_navigate(to: ~p"/#{X.plural_snake_case()}/#{x}")
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

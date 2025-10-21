defmodule NavatrackWeb.AccessPermissions.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Accounts.AccessPermission, as: X

  require Logger

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, X.title_case_plural())

    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    xx =
      X
      |> Ash.Query.for_read(:read)
      |> Ash.read!()

    {:noreply,
     socket
     |> assign(:page_title, X.title_case_plural())
     |> assign(:xx, xx)}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.header>
        {@page_title}
        <:actions>
          <.button navigate={Path.join(["/", X.snake_case_plural(), "new"])}>
            New
          </.button>
        </:actions>
      </.header>

      <Cinder.Table.table theme={Cinder.Themes.Smart} resource={X}>
        <:col :let={x} field="id" label="➡️ Id" filter sort search><.link_show x={x} /></:col>
        <:col :let={x} field="access_attribute_id" label="Access Attribute Id" sort search>{x.access_attribute_id}</:col>
        <:col :let={x} field="access_operation_id" label="Access Operation Id" sort search>{x.access_attribute_id}</:col>
      </Cinder.Table.table>
    </Layouts.app>
    """
  end
end

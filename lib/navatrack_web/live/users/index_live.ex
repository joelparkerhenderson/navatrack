defmodule NavatrackWeb.Users.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Accounts.User, as: X

  require Logger

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, X.plural_title_case())

    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    xx =
      X
      |> Ash.Query.for_read(:read)
      |> Ash.read!()

    {:noreply,
     socket
     |> assign(:page_title, X.plural_title_case())
     |> assign(:xx, xx)}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.header>
        {@page_title}
        <:actions>
          <.button navigate={~p"/users/new"}>
            New
          </.button>
        </:actions>
      </.header>

      <Cinder.Table.table theme={Cinder.Themes.Smart} resource={X}>
        <:col :let={x} field="id" label="➡️ Id" filter sort search><.link_show x={x} /></:col>
        <:col :let={x} field="name" label="📛 Name" sort search>{x.name}</:col>
        <:col :let={x} field="status" label="🚦 Status" sort search>{x.status}</:col>
        <:col :let={x} field="tagging" label="🏷️ Tags" sort search>{x.tagging}</:col>
        <:col :let={x} field="web" label="🌐 Web" sort search>{x.web}</:col>
        <:col :let={x} field="email" label="📧 Email" sort search>{x.email}</:col>
        <:col :let={x} field="phone" label="📱 Phone" sort search>{x.phone}</:col>
        <:col :let={x} field="chat" label="💬 Chat" sort search>{x.chat}</:col>
        <:col :let={x} field="location_iso_3166_1_alpha_2" label="🗺️ Country" sort search>
          {x.location_iso_3166_1_alpha_2}
        </:col>
        <:col :let={x} field="work_role_name" label="👷 Work Role" sort search>
          {x.work_role_name}
        </:col>
      </Cinder.Table.table>
    </Layouts.app>
    """
  end
end

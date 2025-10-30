defmodule NavatrackWeb.UkGdadPcfSkills.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Codes.UkGdadPcfSkill, as: X

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
      </.header>

      <Cinder.Table.table theme={Cinder.Themes.Smart} resource={X}>
        <:col :let={x} field="id" label="➡️ Id" filter sort search><.link_show x={x} /></:col>
        <:col :let={x} field="name" label="📛 Name" sort search>{x.name}</:col>
        <:col :let={x} field="url" label="🔗 URL" sort search><a href={x.url}>{x.url}</a></:col>
      </Cinder.Table.table>
    </Layouts.app>
    """
  end
end

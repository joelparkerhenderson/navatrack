defmodule NavatrackWeb.UkGdadPcfRoles.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Codes.UkGdadPcfRole, as: X

  require Logger

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(%{"id" => id}, _url, socket) do
    x = Ash.get!(X, id)

    {:noreply,
     socket
     |> assign(:page_title, x.name)
     |> assign(:x, x)}
  end

  def render(assigns) do
    ~H"""
    <Layouts.app {assigns}>
      <.header>
        {@page_title}
      </.header>
      <main>
        <ul>
          <li>Id: {@x.id}</li>
          <li>Locale: {@x.locale_code}</li>
          <li>Family: {@x.family}</li>
          <li>Name: {@x.name}</li>
          <li>URL: {@x.url}</li>
          <li>Description as Markdown: {@x.description_as_markdown}</li>
          <li>Level Name:: {@x.level_name}</li>
          <li>Level Description as Markdown: {@x.level_description_as_markdown}</li>
          <li>Senior Civil Service Flag: {@x.senior_civil_service_flag}</li>
        </ul>
      </main>
    </Layouts.app>
    """
  end
end

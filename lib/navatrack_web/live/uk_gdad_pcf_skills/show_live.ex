defmodule NavatrackWeb.UkGdadPcfSkills.ShowLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Codes.UkGdadPcfSkill, as: X

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
          <li>Name: {@x.name}</li>
          <li>URL: {@x.url}</li>
          <li>Description: {@x.description}</li>
          <li>Level 1 Description as Markdown: {@x.level_1_description_as_markdown}</li>
          <li>Level 1 Description as HTML: {@x.level_1_description_as_html}</li>
          <li>Level 2 Description as Markdown: {@x.level_2_description_as_markdown}</li>
          <li>Level 2 Description as HTML: {@x.level_2_description_as_html}</li>
          <li>Level 3 Description as Markdown: {@x.level_3_description_as_markdown}</li>
          <li>Level 3 Description as HTML: {@x.level_3_description_as_html}</li>
          <li>Level 4 Description as Markdown: {@x.level_4_description_as_markdown}</li>
          <li>Level 4 Description as HTML: {@x.level_4_description_as_html}</li>
          <li>
            Roles that require this skill as Markdown: {@x.roles_that_require_this_skill_as_markdown}
          </li>
          <li>Roles that require this skill as HTML: {@x.roles_that_require_this_skill_as_html}</li>
        </ul>
      </main>
    </Layouts.app>
    """
  end
end

defmodule NavatrackWeb.Groups.IndexLive do
  use NavatrackWeb, :live_view
  alias Navatrack.Works.Group, as: X

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
          <.button navigate={Path.join(["/", X.plural_snake_case(), "new"])}>
            New
          </.button>
        </:actions>
      </.header>

      <Cinder.Table.table theme={Cinder.Themes.Smart} resource={X}>
        <:col :let={x} field="id" label="➡️ Id" filter sort search><.link_show x={x} /></:col>
        <:col :let={x} field="name" label="📛 Name" sort search>{x.name}</:col>
        <:col :let={x} field="status" label="🚦 Sign" sort search>{x.status}</:col>
        <:col :let={x} field="status" label="📍 Status" sort search>{x.status}</:col>
        <:col :let={x} field="tagging" label="🏷️ Tags" sort search>{x.tagging}</:col>
        <:col
          :let={x}
          field="net_promoter_score_customer_perspective_actual"
          label="👍 NPS"
          sort
          search
        >
          {x.net_promoter_score_customer_perspective_actual}
        </:col>
        <:col :let={x} field="total_project_control_dipp" label="💘 DIPP" sort search>
          {x.total_project_control_dipp}
        </:col>
        <:col :let={x} field="burn_rate_net_cash_per_week_actual" label="🔥 Burn" sort search>
          {x.burn_rate_net_cash_per_week_actual}
        </:col>
        <:col :let={x} field="deployment_frequency_actual" label="⛵️ Ship" sort search>
          {x.deployment_frequency_actual}
        </:col>
        <:col :let={x} field="maintainability_index_unit" label="🛠️ Code" sort search>
          {x.maintainability_index_unit}
        </:col>
        <:col :let={x} field="home_emoji_url" label="🏠" sort search>
          <.link navigate={x.home_emoji_url}>🏠</.link>
        </:col>
        <:col :let={x} field="bellhop_bell_emoji_url" label="🛎️" sort search>
          <.link navigate={x.bellhop_bell_emoji_url}>🛎️</.link>
        </:col>
        <:col :let={x} field="target_emoji_url" label="🎯" sort search>
          <.link navigate={x.target_emoji_url}>🎯</.link>
        </:col>
        <:col :let={x} field="gear_emoji_url" label="⚙️" sort search>
          <.link navigate={x.gear_emoji_url}>⚙️</.link>
        </:col>
        <:col :let={x} field="spiral_calendar_emoji_url" label="🗓️" sort search>
          <.link navigate={x.spiral_calendar_emoji_url}>🗓️</.link>
        </:col>
        <:col :let={x} field="sparkles_emoji_url" label="✨" sort search>
          <.link navigate={x.sparkles_emoji_url}>✨</.link>
        </:col>
        <:col :let={x} field="speech_bubble_emoji_url" label="💬" sort search>
          <.link navigate={x.speech_bubble_emoji_url}>💬</.link>
        </:col>
        <:col :let={x} field="newspaper_emoji_url" label="📰" sort search>
          <.link navigate={x.newspaper_emoji_url}>📰</.link>
        </:col>
        <:col :let={x} field="bar_chart_emoji_url" label="📊" sort search>
          <.link navigate={x.bar_chart_emoji_url}>📊</.link>
        </:col>
        <:col :let={x} field="movie_camera_emoji_url" label="🎥" sort search>
          <.link navigate={x.movie_camera_emoji_url}>🎥</.link>
        </:col>
        <:col :let={x} field="construction_worker_emoji_url" label="👷" sort search>
          <.link navigate={x.construction_worker_emoji_url}>👷</.link>
        </:col>
        <:col :let={x} field="crystal_ball_emoji_url" label="🔮" sort search>
          <.link navigate={x.crystal_ball_emoji_url}>🔮</.link>
        </:col>
        <:col :let={x} field="butterfly_emoji_url" label="🦋" sort search>
          <.link navigate={x.butterfly_emoji_url}>🦋</.link>
        </:col>
        <:col :let={x} field="lady_beetle_emoji_url" label="🐞" sort search>
          <.link navigate={x.lady_beetle_emoji_url}>🐞</.link>
        </:col>
      </Cinder.Table.table>
    </Layouts.app>
    """
  end
end

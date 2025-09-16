defmodule Navatrack.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      NavatrackWeb.Telemetry,
      Navatrack.Repo,
      {DNSCluster, query: Application.get_env(:navatrack, :dns_cluster_query) || :ignore},
      {Oban,
       AshOban.config(
         Application.fetch_env!(:navatrack, :ash_domains),
         Application.fetch_env!(:navatrack, Oban)
       )},
      {Phoenix.PubSub, name: Navatrack.PubSub},
      # Start a worker by calling: Navatrack.Worker.start_link(arg)
      # {Navatrack.Worker, arg},
      # Start to serve requests, typically the last entry
      NavatrackWeb.Endpoint,
      {Absinthe.Subscription, NavatrackWeb.Endpoint},
      AshGraphql.Subscription.Batcher,
      {AshAuthentication.Supervisor, [otp_app: :navatrack]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Navatrack.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NavatrackWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule Book.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Book.Repo,
      # Start the Telemetry supervisor
      BookWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Book.PubSub},
      # Start the Endpoint (http/https)
      BookWeb.Endpoint
      # Start a worker by calling: Book.Worker.start_link(arg)
      # {Book.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Book.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    BookWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

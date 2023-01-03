defmodule CineasteData.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CineasteData.Repo
    ]

    opts = [strategy: :one_for_one, name: CineasteData.Supervisor]

    Supervisor.start_link(children, opts)
  end
end

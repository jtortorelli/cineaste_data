defmodule CineasteData.Repo do
  use Ecto.Repo,
    otp_app: :cineaste_data,
    adapter: Ecto.Adapters.Postgres
end

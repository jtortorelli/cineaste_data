defmodule CineasteData.FilmSynopsis do
  use Ecto.Schema

  alias CineasteData.Film

  schema "film_synopses" do
    field :synopsis, :string

    belongs_to :film, Film

    timestamps()
  end
end

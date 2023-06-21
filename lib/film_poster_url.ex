defmodule CineasteData.FilmPosterUrl do
  use Ecto.Schema

  @primary_key false
  embedded_schema do
    field :url, :string
    field :primary, :boolean
  end
end

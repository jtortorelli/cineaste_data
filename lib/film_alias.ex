defmodule CineasteData.FilmAlias do
  use Ecto.Schema

  @primary_key false
  embedded_schema do
    field :title, :string
    field :context, :string
  end
end

defmodule CineasteData.FilmStudio do
  use Ecto.Schema
  import Ecto.Changeset

  alias CineasteData.{Film, Studio}

  schema "film_studios" do
    belongs_to :film, Film
    belongs_to :studio, Studio
    timestamps()
  end

  def changeset(film_studio, attrs) do
    film_studio
    |> cast(attrs, [:film_id, :studio_id])
    |> validate_required([:film_id, :studio_id])
    |> assoc_constraint(:film)
    |> assoc_constraint(:studio)
  end
end

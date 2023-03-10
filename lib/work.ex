defmodule CineasteData.Work do
  use Ecto.Schema
  import Ecto.Changeset

  alias CineasteData.{AuthorWork, Film, Person}

  schema "works" do
    field(:format, Ecto.Enum, values: [:novel, :manga, :"serialized novel"])
    field(:title, :string)

    has_many(:films, Film)

    many_to_many(:authors, Person, join_through: AuthorWork)

    timestamps()
  end

  @doc false
  def changeset(work, attrs) do
    work
    |> cast(attrs, [:title, :format])
    |> validate_required([:title, :format])
  end
end

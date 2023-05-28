defmodule CineasteData.Work do
  use Ecto.Schema
  import Ecto.Changeset

  alias CineasteData.{AuthorWork, Film, FilmWork, Label, Person, Publisher, Studio, StudioWork}

  @formats [
    :anime,
    :manga,
    :novel,
    :"novel series",
    :"original story",
    :"picture story",
    :screenplay,
    :"serialized novel",
    :"short story",
    :"unpublished novel"
  ]

  schema "works" do
    field :format, Ecto.Enum, values: @formats
    field :title, :string
    field :year, :integer

    belongs_to :publisher, Publisher
    belongs_to :label, Label

    many_to_many :authors, Person, join_through: AuthorWork
    many_to_many :films, Film, join_through: FilmWork
    many_to_many :studios, Studio, join_through: StudioWork

    timestamps()
  end

  @doc false
  def changeset(work, attrs) do
    work
    |> cast(attrs, [:title, :format, :year, :publisher_id, :label_id])
    |> validate_required([:title, :format])
    |> assoc_constraint(:publisher)
    |> assoc_constraint(:label)
  end
end

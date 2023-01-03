defmodule CineasteData.PersonStaff do
  use Ecto.Schema
  import Ecto.Changeset

  alias CineasteData.{Film, Person}

  schema "person_staff" do
    field :order, :string
    field :role, :string

    belongs_to :film, Film
    belongs_to :person, Person

    timestamps()
  end

  @doc false
  def changeset(person_staff, attrs) do
    person_staff
    |> cast(attrs, [:role, :order])
    |> validate_required([:role, :order])
  end
end

defmodule CineasteData.PersonRole do
  use Ecto.Schema
  import Ecto.Changeset

  alias CineasteData.{Character, Film, Person}

  schema "person_roles" do
    field :actor_alias, :string
    field :avatar_url, :string
    field :name, :string
    field :order, :string
    field :uncredited, :boolean, default: false

    belongs_to :person, Person
    belongs_to :film, Film
    belongs_to :character, Character

    timestamps()
  end

  @doc false
  def changeset(person_role, attrs) do
    person_role
    |> cast(attrs, [:name, :order, :uncredited, :avatar_url, :actor_alias])
    |> validate_required([:name, :order, :uncredited, :avatar_url, :actor_alias])
  end
end

defmodule CineasteData.KaijuRole do
  use Ecto.Schema
  import Ecto.Changeset

  alias CineasteData.{Film, KaijuCharacter, KaijuVariant, Person}

  schema "kaiju_roles" do
    field :actor_alias, :string
    field :avatar_url, :string
    field :name, :string
    field :order, :string
    field :qualifiers, {:array, :string}
    field :uncredited, :boolean, default: false

    belongs_to :person, Person
    belongs_to :film, Film
    belongs_to :kaiju_character, KaijuCharacter
    belongs_to :kaiju_variant, KaijuVariant

    timestamps()
  end

  @doc false
  def changeset(kaiju_role, attrs) do
    kaiju_role
    |> cast(attrs, [
      :actor_alias,
      :avatar_url,
      :film_id,
      :kaiju_character_id,
      :kaiju_variant_id,
      :name,
      :order,
      :person_id,
      :qualifiers,
      :uncredited
    ])
    |> validate_required([:film_id, :name, :order, :uncredited])
    |> assoc_constraint(:film)
    |> assoc_constraint(:kaiju_character)
    |> assoc_constraint(:kaiju_variant)
    |> assoc_constraint(:person)
  end
end

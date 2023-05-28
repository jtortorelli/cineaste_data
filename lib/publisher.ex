defmodule CineasteData.Publisher do
  use Ecto.Schema
  import Ecto.Changeset

  alias CineasteData.Label

  schema "publishers" do
    field :slug, :string
    field :name, :string

    has_many :labels, Label
    timestamps()
  end

  def changeset(publisher, attrs) do
    publisher
    |> cast(attrs, [:slug, :name])
    |> validate_required([:slug, :name])
  end
end

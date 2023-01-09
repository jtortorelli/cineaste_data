defmodule CineasteData.GroupStaff do
  alias CineasteData.Film
  use Ecto.Schema
  import Ecto.Changeset

  alias CineasteData.{Film, Group}

  schema "group_staff" do
    field :order, :string
    field :role, :string

    belongs_to :film, Film
    belongs_to :group, Group

    timestamps()
  end

  def changeset(group_staff, attrs) do
    group_staff
    |> cast(attrs, [:role, :order])
    |> validate_required([:role, :order])
  end
end

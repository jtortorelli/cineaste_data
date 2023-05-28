defmodule CineasteData.AuthorWork do
  use Ecto.Schema
  import Ecto.Changeset

  schema "author_works" do
    field :person_id, :id
    field :work_id, :id
    timestamps()
  end

  def changeset(author_work, attrs) do
    author_work
    |> cast(attrs, [:person_id, :work_id])
    |> validate_required([:person_id, :work_id])
    |> assoc_constraint(:person)
    |> assoc_constraint(:work)
  end
end

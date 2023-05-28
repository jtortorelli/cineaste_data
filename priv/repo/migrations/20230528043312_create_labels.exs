defmodule CineasteData.Repo.Migrations.CreateLabels do
  use Ecto.Migration

  def change do
    create tabel(:labels) do
      add :slug, :string
      add :name, :string
      add :publisher_id, references(:publishers)
      timestamps()
    end

    create unique_index(:labels, [:slug])
  end
end

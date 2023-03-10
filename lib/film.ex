defmodule CineasteData.Film do
  use Ecto.Schema
  import Ecto.Changeset

  alias CineasteData.{
    FilmAlias,
    FilmCredits,
    FilmOriginalTitle,
    FilmPosterUrl,
    FilmSeriesEntry,
    FilmStudio,
    FilmSynopsis,
    GroupRole,
    GroupStaff,
    KaijuRole,
    PersonRole,
    PersonStaff,
    Studio,
    Work
  }

  schema "films" do
    field :release_date, :date
    field :runtime, :integer
    field :showcased, :boolean, default: false
    field :slug, :string
    field :sort_title, :string
    field :tenant, :integer
    field :title, :string

    embeds_many :aliases, FilmAlias
    embeds_many :poster_urls, FilmPosterUrl
    embeds_one :original_title, FilmOriginalTitle

    belongs_to :work, Work

    has_many :kaiju_roles, KaijuRole
    has_many :person_roles, PersonRole
    has_many :person_staff, PersonStaff

    has_many :group_roles, GroupRole
    has_many :group_staff, GroupStaff

    has_one :series_entry, FilmSeriesEntry
    has_one :synopsis, FilmSynopsis
    has_one :credits, FilmCredits

    many_to_many :studios, Studio, join_through: FilmStudio

    timestamps()
  end

  @doc false
  def changeset(film, attrs) do
    film
    |> cast(attrs, [:slug, :title, :release_date, :runtime, :showcased, :tenant, :sort_title])
    |> validate_required([
      :slug,
      :title,
      :release_date,
      :runtime,
      :showcased,
      :tenant,
      :sort_title
    ])
  end
end

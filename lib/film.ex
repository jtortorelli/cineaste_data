defmodule CineasteData.Film do
  use Ecto.Schema
  import Ecto.Changeset

  alias CineasteData.Role
  alias CineasteData.{
    FilmAlias,
    FilmCredits,
    FilmOriginalTitle,
    FilmPosterUrl,
    FilmSeriesEntry,
    FilmStudio,
    FilmSynopsis,
    FilmWork,
    GroupRole,
    GroupStaff,
    KaijuRole,
    PersonRole,
    PersonStaff,
    ProductionCommittee,
    Role,
    Staff,
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

    belongs_to :production_committee, ProductionCommittee

    embeds_many :aliases, FilmAlias, on_replace: :delete
    embeds_many :poster_urls, FilmPosterUrl, on_replace: :delete
    embeds_one :original_title, FilmOriginalTitle, on_replace: :update

    has_many :kaiju_roles, KaijuRole
    has_many :person_roles, PersonRole
    has_many :person_staff, PersonStaff

    has_many :group_roles, GroupRole
    has_many :group_staff, GroupStaff

    has_many :roles, Role
    has_many :staff, Staff

    has_one :series_entry, FilmSeriesEntry
    has_one :synopsis, FilmSynopsis
    has_one :credits, FilmCredits

    many_to_many :studios, Studio, join_through: FilmStudio
    many_to_many :works, Work, join_through: FilmWork

    timestamps()
  end

  @doc false
  def changeset(film, attrs \\ %{}) do
    film
    |> cast(attrs, [
      :slug,
      :title,
      :release_date,
      :runtime,
      :showcased,
      :tenant,
      :sort_title,
      :production_committee_id
    ])
    |> validate_required([
      :slug,
      :title,
      :release_date,
      :runtime,
      :showcased,
      :tenant,
      :sort_title
    ])
    |> unique_constraint(:slug)
    |> cast_embed(:aliases,
      with: &FilmAlias.changeset/2,
      sort_param: :alias_order,
      drop_param: :alias_delete
    )
    |> cast_embed(:poster_urls,
      with: &FilmPosterUrl.changeset/2,
      sort_param: :poster_url_order,
      drop_param: :poster_url_delete
    )
    |> cast_embed(:original_title)
    |> assoc_constraint(:production_committee)
  end
end

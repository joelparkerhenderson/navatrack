defmodule Navatrack.Works.UserReview do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "user_review"
  def snake_case_plural(), do: "user_reviews"
  def title_case_singular(), do: "UserReview"
  def title_case_plural(), do: "UserReviews"

  postgres do
    table "user_reviews"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, :create, :update]

    default_accept [
      ### meta
      :created_at,
      :updated_at,
      :deleted_at,
      :locale_code,
      :parent_id,
      :parent_order,
      ### card
      :name,
      :sign,
      :status,
      :tagging,
      :note,
      ### relationships
      :by_user_id,
      :to_user_id,
      ### content
      :strength,
      :start,
      :stop,
      :continue,
      :change,
      :advice
    ]
  end

  attributes do
    ### meta
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :locale_code, :string
    attribute :parent_id, :uuid
    attribute :parent_order, :integer
    ### card
    attribute :name, :string
    attribute :sign, :string
    attribute :status, :string
    attribute :tagging, :string
    attribute :note, :string
    ### relationships
    attribute :by_user_id, :uuid, allow_nil?: false
    attribute :to_user_id, :uuid, allow_nil?: false
    ### content
    attribute :strength, :string
    attribute :start, :string
    attribute :stop, :string
    attribute :continue, :string
    attribute :change, :string
    attribute :advice, :string
  end

  relationships do

    belongs_to :parent, __MODULE__, allow_nil?: true

    belongs_to :by, Navatrack.Accounts.User do
      source_attribute :by_user_id
    end

    belongs_to :to, Navatrack.Accounts.User do
      source_attribute :to_user_id
    end

  end

  def fab!(map \\ %{}) do
    map = Map.put_new_lazy(map, :by_user_id, fn -> Navatrack.Accounts.User.fab!().id end)
    map = Map.put_new_lazy(map, :to_user_id, fn -> Navatrack.Accounts.User.fab!().id end)
    __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
  end

  def fab_map(map \\ %{}) do
    Map.merge(
      %{
        ### meta
        locale_code: "en-US",
        parent_id: nil,
        parent_order: nil,
        ### card
        name: "my-name",
        sign: "○",
        status: "my-status",
        tagging: "my-tagging",
        note: "my-note",
        ### relationships
        by_user_id: nil,
        to_user_id: nil,
        ### content
        strength: "my-strength",
        start: "my-start",
        stop: "my-stop",
        continue: "my-continue",
        change: "my-change",
        advice: "my-advice"
      },
      map
    )
  end

end

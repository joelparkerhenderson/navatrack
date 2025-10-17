defmodule Navatrack.Works.MultiRaterFeedbackMessage do
  use Ash.Resource,
    otp_app: :navatrack,
    domain: Navatrack.Works,
    data_layer: AshPostgres.DataLayer

  def snake_case_singular(), do: "multi_rater_feedback_message"
  def snake_case_plural(), do: "multi_rater_feedback_messages"
  def title_case_singular(), do: "MultiRaterFeedbackMessage"
  def title_case_plural(), do: "MultiRaterFeedbackMessages"

  postgres do
    table "multi_rater_feedback_messages"
    repo Navatrack.Repo
  end

  actions do
    defaults [:read, :destroy, :create, :update]

    default_accept [
      :created_at,
      :updated_at,
      :deleted_at,
      :locale_code,
      :name,
      :sign,
      :status,
      :tagging,
      :note,
      :writer_as_user_id,
      :reader_as_user_id,
      :strength,
      :start,
      :stop,
      :continue,
      :change,
      :advice
    ]
  end

  attributes do
    uuid_primary_key :id
    attribute :created_at, :utc_datetime_usec
    attribute :updated_at, :utc_datetime_usec
    attribute :deleted_at, :utc_datetime_usec
    attribute :locale_code, :string
    attribute :name, :string
    attribute :sign, :string
    attribute :status, :string
    attribute :tagging, :string
    attribute :note, :string
    attribute :writer_as_user_id, :uuid, allow_nil?: false
    attribute :reader_as_user_id, :uuid, allow_nil?: false
    attribute :strength, :string
    attribute :start, :string
    attribute :stop, :string
    attribute :continue, :string
    attribute :change, :string
    attribute :advice, :string
  end

  relationships do
    belongs_to :writer, Navatrack.Accounts.User do
      source_attribute :writer_as_user_id
    end
    belongs_to :reader, Navatrack.Accounts.User do
      source_attribute :reader_as_user_id
    end
  end
end

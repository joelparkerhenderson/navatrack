defmodule Navatrack.Works.Message.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do

    ### meta

    uuid_primary_key :id

    attribute :created_at, :utc_datetime_usec do
      description "Created at UTC datetime in microseconds"
    end

    attribute :updated_at, :utc_datetime_usec do
      description "Updated at UTC datetime in microseconds"
    end

    attribute :retired_at, :utc_datetime_usec do
      description "Updated at UTC datetime in microseconds"
    end

    attribute :locale_code, :string do
      description "Locale code"
    end

    attribute :parent_id, :uuid do
      description "Parent id"
    end

    attribute :parent_order, :integer do
      description "Parent order"
    end

    ### card

    attribute :name, :string do
      description "Name"
    end

    attribute :sign, :string do
      description "Sign emoji character"
    end

    attribute :status, :string do
      description "Status text"
    end

    attribute :tagging, :string do
      description "Tagging text with hashtags such as #alfa #bravo #charlie"
    end

    attribute :note, :string do
      description "Note text"
    end

    ### relationships

    attribute :from_user_id, :uuid, allow_nil?: false
    attribute :to_user_id, :uuid, allow_nil?: false
  end

end

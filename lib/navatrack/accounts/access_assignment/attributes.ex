defmodule Navatrack.Accounts.AccessAssignment.Attributes do
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

    attribute :parent_id, :string do
      description "Parent id"
    end

    attribute :parent_order, :integer do
      description "Parent order"
    end

    ### relationships

    attribute :user_id, :uuid do
      description "User id"
    end

    attribute :access_attribute_id, :uuid do
      description "Access atrribute id"
    end

  end

end

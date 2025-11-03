defmodule Navatrack.Accounts.UserIloIsco2008Link.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do
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

    attribute :user_id, :uuid do
      description "User id"
    end

    attribute :ilo_isco_2008_id, :uuid
  end

end

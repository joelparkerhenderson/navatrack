defmodule Navatrack.Accounts.Token.Attributes do
  use Spark.Dsl.Fragment, of: Ash.Resource

  attributes do
    attribute :jti, :string do
      primary_key? true
      public? true
      allow_nil? false
      sensitive? true
    end

    attribute :subject, :string do
      allow_nil? false
      public? true
    end

    attribute :expires_at, :utc_datetime do
      allow_nil? false
      public? true
    end

    attribute :purpose, :string do
      allow_nil? false
      public? true
    end

    attribute :extra_data, :map do
      public? true
    end
  end

end

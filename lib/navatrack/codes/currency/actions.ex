defmodule Navatrack.Codes.Currency.Actions do
  use Spark.Dsl.Fragment, of: Ash.Resource

  actions do
    defaults [:read, create: :*]
  end

end

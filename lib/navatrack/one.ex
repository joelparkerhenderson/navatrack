defmodule One do
  defmacro __using__(_opts) do
    quote do
      def one() do
        import Ecto.Query
        __MODULE__
        |> order_by(fragment("RANDOM()"))
        |> limit(1)
        |> Navatrack.Repo.one()
      end
    end
  end
end

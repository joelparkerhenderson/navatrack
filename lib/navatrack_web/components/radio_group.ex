defmodule NavatrackWeb.Components.RadioGroup do
  defmacro __using__(_opts) do
    quote do

      @doc """
      Provides a radio group input for a given form field.

      Source: https://github.com/phoenixframework/phoenix/pull/5506

      ## Examples

          <.radio_group field={@form[:tip]}>
            <:radio value="0">No Tip</:radio>
            <:radio value="10">10%</:radio>
            <:radio value="20">20%</:radio>
          </.radio_group>

      """
      attr :field, Phoenix.HTML.FormField, required: true

      slot :radio, required: true do
        attr :value, :string, required: true
      end

      slot :inner_block

      def radio_group(assigns) do
        ~H"""
        <div>
          <%= render_slot(@inner_block) %>
          <div :for={{%{value: value} = rad, idx} <- Enum.with_index(@radio)}>
            <label for={"#{@field.id}-#{idx}"}><%= render_slot(rad) %></label>
            <input
              type="radio"
              name={@field.name}
              id={"#{@field.id}-#{idx}"}
              value={value}
              checked={to_string(@field.value) == to_string(value)}
            />
          </div>
        </div>
        """
      end

    end
  end
end

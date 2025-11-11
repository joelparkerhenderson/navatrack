defmodule NavatrackWeb.Components.SectionHeadlineParagraph do
  use Phoenix.Component
  use NavatrackWeb, :html

  @doc """
  Render a form section with a headline, paragraph.

  Example:

  ```heex
  <.section_with_headline_paragraph
    form={@form}
    section_id={:my_section}
    headline="My Headline"
    paragraph="My Paragraph"
  >
    hello world
  </.section_with_headline_paragraph>
  ```
  """

  attr :form, :any, required: true
  attr :section_id, :atom, required: true
  attr :headline, :string, required: true
  attr :paragraph, :string, required: true
  slot :inner_block, required: true

  def section_headline_paragraph(assigns) do
    ~H"""
    <section
      id={@section_id}
      class="pb-4"
      phx-update="ignore"
    >
      <h2 class="pb-4"><%= @headline %></h2>
      <p class="pb-4"><%= @paragraph %></p>
      <%= render_slot(@inner_block) %>
    </section>
    """
  end

end

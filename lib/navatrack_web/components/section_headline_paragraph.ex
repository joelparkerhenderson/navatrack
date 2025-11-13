defmodule NavatrackWeb.Components.SectionHeadlineParagraph do
  use Phoenix.Component
  use NavatrackWeb, :html

  @doc """
  Render a section with a headline and paragraph.

  Example:

  ```heex
  <.section_headline_paragraph
    form={@form}
    id={:my_section_id}
    headline="My Headline"
    paragraph="My Paragraph"
  >
    hello world
  </.section_headline_paragraph>
  ```
  """

  attr :id, :atom, required: true
  attr :headline, :string, required: true
  attr :paragraph, :string, required: true
  slot :inner_block, required: true

  def section_headline_paragraph(assigns) do
    ~H"""
    <section
      id={@id}
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

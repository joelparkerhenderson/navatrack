defmodule Navatrack.Works.Trait.Actions do
  use Spark.Dsl.Fragment, of: Ash.Resource

  actions do
    defaults [:create, :read, :update, :destroy]

    default_accept [
      ### meta
      :created_at,
      :updated_at,
      :retired_at,
      :locale_code,
      :parent_id,
      :parent_order,
      ### card
      :name,
      :sign,
      :status,
      :tagging,
      :note,
      ### content
      :summary_as_markdown,
      :description_as_markdown,
      ### avatar
      :avatar_image_400x400_url,
      :avatar_image_400x400_alt,
      ### main image
      :main_image_1080x1080_url,
      :main_image_1080x1080_alt,
      :main_image_1920x1080_url,
      :main_image_1920x1080_alt,
      :main_image_1080x1920_url,
      :main_image_1080x1920_alt
    ]
  end

end

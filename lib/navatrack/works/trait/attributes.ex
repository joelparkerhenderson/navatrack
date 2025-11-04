defmodule Navatrack.Works.Trait.Attributes do
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

    ### content

    attribute :summary_as_markdown, :string do
      description "Summary as markdown"
    end

    attribute :description_as_markdown, :string do
      description "Description as markdown"
    end

    ### images

    attribute :avatar_image_400x400_url, :string do
      description "Avatar image 400x400 URL"
    end

    attribute :avatar_image_400x400_alt, :string do
      description "Avatar image 400x400 alt text"
    end

    attribute :main_image_1080x1080_url, :string do
      description "Main image 1080x1080 URL"
    end

    attribute :main_image_1080x1080_alt, :string do
      description "Main image 1080x1080 alt text"
    end

    attribute :main_image_1920x1080_url, :string do
      description "Main image 1920x1080 URL"
    end

    attribute :main_image_1920x1080_alt, :string do
      description "Main image 1920x1080 alt text"
    end

    attribute :main_image_1080x1920_url, :string do
      description "Main image 1080x1920 URL"
    end

    attribute :main_image_1080x1920_alt, :string do
      description "Main image 1080x1920 alt text"
    end

  end

end

defmodule Navatrack.Works.Trait.Fab do
  defmacro __using__(_opts) do
    quote do

      def fab!(map \\ %{}) do
        __MODULE__ |> Ash.Changeset.for_create(:create, __MODULE__.fab_map(map)) |> Ash.create!()
      end

      def fab_map(map \\ %{}) do
        Map.merge(
          %{
            locale_code: "en-US",
            parent_id: nil,
            parent_order: nil,
            ### card
            name: "my-name",
            sign: "○",
            status: "my-status",
            tagging: "my-tagging",
            note: "my-note",
            summary_as_markdown: "summary-as-markdown",
            description_as_markdown: "description-as-markdown",
            avatar_image_400x400_url: "https://my-avatar-image-400x400-url",
            avatar_image_400x400_alt: "my-avatar-image-400x400-alt",
            main_image_1080x1080_url: "https://my-main-image-1080x1080-url",
            main_image_1080x1080_alt: "my-main-image-1080x1080-alt",
            main_image_1920x1080_url: "https://my-main-image-1920x1080-url",
            main_image_1920x1080_alt: "my-main-image-1920x1080-alt",
            main_image_1080x1920_url: "https://my-main-image-1080x1920-url",
            main_image_1080x1920_alt: "my-main-image-1080x1920-alt",
          },
          map
        )
      end

    end
  end
end

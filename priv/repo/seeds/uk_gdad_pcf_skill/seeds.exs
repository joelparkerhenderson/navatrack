# To run this script:
#
# ```sh
# mix run -r priv/repo/seeds/uk_gdad_pcf_skill/seeds.exs
# ```

Path.join(__DIR__, "seeds.csv")
|> File.stream!()
|> CSV.decode!(headers: true, escape_max_lines: 200)
|> Enum.each(fn row ->
  IO.inspect(row)
  Navatrack.Repo.insert!(%Navatrack.Codes.UkGdadPcfSkill{
    locale_code: "en-GB",
    name: row["Skill Name"],
    url: "https://ddat-capability-framework.service.gov.uk/skills#" <> Recase.to_kebab(row["Skill Name"]),
    description: row["Skill Description"],
    level_1_description_as_markdown: row["Awareness"],
    level_2_description_as_markdown: row["Working"],
    level_3_description_as_markdown: row["Practitioner"],
    level_4_description_as_markdown: row["Expert"],
    roles_that_require_this_skill_as_markdown: row["Roles that require Skill"],
  })
end)

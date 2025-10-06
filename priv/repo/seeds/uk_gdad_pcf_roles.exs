# To run this script:
#
# ```sh
# mix run -r priv/repo/seeds/uk_gdad_pcf_roles.exs
# ```

File.stream!("priv/repo/seeds/uk_gdad_pcf_roles.csv")
|> CSV.decode!(headers: true, escape_max_lines: 200)
|> Enum.each(fn row ->
  IO.inspect(row)
  Navatrack.Repo.insert!(%Navatrack.Codes.UkGdadPcfRole{
    locale_code: "en-GB",
    family: row["Role Family"],
    name: row["Role"],
    url: "https://ddat-capability-framework.service.gov.uk/role/" <> Recase.to_kebab(row["Role"]),
    description_as_markdown: row["Role Description"],
    description_as_html: MDEx.to_html!(row["Role Description"]),
    level_name: row["Role Level"],
    level_description_as_markdown: row["Role Level Description"],
    level_description_as_html: MDEx.to_html!(row["Role Level Description"]),
    senior_civil_service_flag: false,
  })
end)

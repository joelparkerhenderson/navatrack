# To run this script:
#
# ```sh
# mix run -r priv/repo/seeds/ilo_isco_2008/seeds.exs
# ```

alias Navatrack.Codes.IloIsco2008, as: X

Path.join(__DIR__, "seeds.csv")
|> File.stream!()
|> CSV.decode!(headers: true, escape_max_lines: 200)
|> Enum.each(fn row ->
  Navatrack.Repo.insert!(%X{
    locale_code: "en",
    code: row["Code"],
    name: row["Name"],
    definition_as_markdown: row["Definition"],
  })
end)

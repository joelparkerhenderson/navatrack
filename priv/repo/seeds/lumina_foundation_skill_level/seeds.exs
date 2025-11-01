# To run this script:
#
# ```sh
# mix run -r priv/repo/seeds/lumina_foundation_skill_level/seeds.exs
# ```

alias Navatrack.Codes.LuminaFoundationSkillLevel, as: X

Path.join(__DIR__, "seeds.tsv")
|> File.stream!()
|> Stream.map(&String.trim/1)
|> Enum.each(fn row ->
  IO.inspect(row)
   [number, name, description] = String.split(row, "\t")
   Navatrack.Repo.insert!(%X{
     locale_code: "en",
     number: String.to_integer(number),
     name: name,
     description: description,
   })
end)

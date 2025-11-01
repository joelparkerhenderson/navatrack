# To run this script:
#
# ```sh
# mix run -r priv/repo/seeds/measurement_unit/seeds.exs
# ```

alias Navatrack.Codes.MeasurementUnit, as: X

measurement_system = Navatrack.Codes.MeasurementSystem.one()

Path.join(__DIR__, "seeds.tsv")
|> File.stream!()
|> Stream.map(&String.trim/1)
|> Enum.each(fn row ->
  [
      code,
      name,
      category,
      synonyms,
      loinc_property,
      guidance,
      _measurement_system,
   ] = String.split(row, "\t")
   Navatrack.Repo.insert!(%X{
      id: code,
      locale_code: "en",
      name: name,
      category: category,
      synonyms: synonyms,
      loinc_property: loinc_property,
      guidance: guidance,
      measurement_system_id: measurement_system.id,
   })
end)

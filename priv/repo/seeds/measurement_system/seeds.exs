# To run this script:
#
# ```sh
# mix run -r priv/repo/seeds/measurement_system/seeds.exs
# ```

alias Navatrack.Codes.MeasurementSystem, as: X

Path.join(__DIR__, "seeds.tsv")
|> File.stream!()
|> Stream.map(&String.trim/1)
|> Enum.each(fn row ->
    [
        code,
        name,
        name_phonetic,
        name_abbreviation,
        name_abbreviation_phonetic,
    ] = String.split(row, "\t")
    Navatrack.Repo.insert!(%X{
        id: ZID.to_uuid_string(code),
        locale_code: "en",
        name: name,
        name_phonetic: name_phonetic,
        name_abbreviation: name_abbreviation,
        name_abbreviation_phonetic: name_abbreviation_phonetic,
    })
end)

# To run this script:
#
# ```sh
# mix run -r priv/repo/seeds/currency/seeds.exs
# ```

Path.join(__DIR__, "seeds.tsv")
|> File.stream!()
|> Stream.map(&String.trim/1)
|> Enum.each(fn row ->
  [code, number, name, symbol, position] = String.split(row, "\t")
  Navatrack.Repo.insert!(%Navatrack.Codes.Currency{
    id: code,
    locale_code: "en",
    number: String.to_integer(number),
    name: name,
    symbol: symbol,
    position: (position == "1")
  })
end)

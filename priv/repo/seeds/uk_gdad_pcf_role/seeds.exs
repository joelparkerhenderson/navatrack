# To run this script:
#
# ```sh
# mix run -r priv/repo/seeds/uk_gdad_pcf_role/seeds.exs
# ```

import AshFindOrCreate, only: [ash_find_or_create: 3]
require Ash.Query
require Ash.Expr
import Ash.Expr, only: [expr: 1]

Path.join(__DIR__, "seeds.csv")
|> File.stream!()
|> CSV.decode!(headers: true, escape_max_lines: 200)
|> Enum.each(fn row ->

    role_family = ash_find_or_create(
      Navatrack.Codes.UkGdadPcfRoleFamily,
      Navatrack.Codes.UkGdadPcfRoleFamily |> Ash.Query.filter(expr(name == ^row["Role Family"])),
      %{
        locale_code: "en-GB",
        name: row["Role Family"]
      }
    )

    role = ash_find_or_create(
      Navatrack.Codes.UkGdadPcfRole,
      Navatrack.Codes.UkGdadPcfRole |> Ash.Query.filter(expr(uk_gdad_pcf_role_family_id == ^role_family.id and name == ^row["Role"])),
      %{
        locale_code: "en-GB",
        uk_gdad_pcf_role_family_id: role_family.id,
        name: row["Role"],
        url: "https://ddat-capability-framework.service.gov.uk/role/" <> Recase.to_kebab(row["Role"]),
        description_as_markdown: row["Role Description"],
        senior_civil_service_flag: false,
      }
    )

    _role_level = ash_find_or_create(
      Navatrack.Codes.UkGdadPcfRoleLevel,
      Navatrack.Codes.UkGdadPcfRoleLevel |> Ash.Query.filter(expr(uk_gdad_pcf_role_id == ^role.id and name == ^row["Role Level"])),
      %{
        locale_code: "en-GB",
        uk_gdad_pcf_role_id: role.id,
        uk_gdad_pcf_role_order: 0,
        name: row["Role Level"],
        description_as_markdown: row["Role Level Description"],
      }
    )

end)

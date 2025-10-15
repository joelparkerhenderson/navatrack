# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Navatrack.Repo.insert!(%Navatrack.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
# We organize seeds into a subdirectory `seeds` and multiple files.
#
# For more about how to organize seeds this way:
#
# <https://experimentingwithcode.com/organizing-phoenix-seeds/>

Code.require_file("seeds/users.exs", __DIR__)
Code.require_file("seeds/topics.exs", __DIR__)
Code.require_file("seeds/traits.exs", __DIR__)
Code.require_file("seeds/lumina_foundation_skill_level/seeds.exs", __DIR__)
Code.require_file("seeds/ilo_isco_2008/seeds.exs", __DIR__)
Code.require_file("seeds/uk_gdad_pcf_role/seeds.exs", __DIR__)
Code.require_file("seeds/uk_gdad_pcf_skill/seeds.exs", __DIR__)

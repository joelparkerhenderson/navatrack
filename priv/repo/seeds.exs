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
Code.require_file("seeds/ilo_isco_2008.exs", __DIR__)
Code.require_file("seeds/uk_gdad_pcf_roles.exs", __DIR__)
Code.require_file("seeds/uk_gdad_pcf_skills.exs", __DIR__)

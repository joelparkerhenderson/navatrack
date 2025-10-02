defmodule Navatrack.Repo.Migrations.CreateUkGdadPcfSkill do
  @moduledoc """
  Create table uk_gdad_pcf_skils.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE uk_gdad_pcf_skills (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      locale_code text not null,
      name text not null,
      url text not null,
      description text not null,
      level_1_description_as_markdown text not null,
      level_1_description_as_html text not null,
      level_2_description_as_markdown text not null,
      level_2_description_as_html text not null,
      level_3_description_as_markdown text not null,
      level_3_description_as_html text not null,
      level_4_description_as_markdown text not null,
      level_4_description_as_html text not null,
      roles_that_require_this_skill_as_markdown text not null,
      roles_that_require_this_skill_as_html text not null
    )
    """
    execute "CREATE INDEX uk_gdad_pcf_skills_locale_code_index ON uk_gdad_pcf_skills (locale_code);"
    execute "CREATE INDEX uk_gdad_pcf_skills_name_index ON uk_gdad_pcf_skills (name);"
    execute "CREATE INDEX uk_gdad_pcf_skills_name_index_tpo ON uk_gdad_pcf_skills (name text_pattern_ops);"
  end

  def down do
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_skills_locale_code_index;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_skills_name_index;"
    execute "DROP INDEX IF EXISTS uk_gdad_pcf_skills_name_index_tpo"
    execute "DROP TABLE IF EXISTS uk_gdad_pcf_skills;"
  end

end

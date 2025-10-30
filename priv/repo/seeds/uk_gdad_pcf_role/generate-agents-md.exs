# To run this script:
#
# ```sh
# mix run -r priv/repo/seeds/uk_gdad_pcf_role/generate-agents-md.exs
# ```

defmodule Level do
  defstruct [
    family_name: "",
    role_name: "",
    role_description: "",
    level_name: "",
    level_description: ""
  ]

  def slug(level) do
    Slugy.slugify("#{level.family_name}-#{level.role_name}-#{level.level_name}#")
  end

  def to_string(level) do
    "#{level.family_name} role: #{level.role_name}\n- #{level.role_description}\n\nRole level: #{level.level_name}\n- #{level.level_description}"
  end

end

defmodule Skill do
  defstruct [
    skill_name: "",
    skill_description: "",
    skill_level_name: "",
    skill_level_description: ""
  ]

  def complete?(skill) do
    skill.skill_name not in [nil, ""] and
    skill.skill_description not in [nil, ""] and
    skill.skill_level_name not in [nil, ""] and
    skill.skill_level_description not in [nil, ""]
  end

  def to_string(skill) do
    "\n\nSkill: #{skill.skill_name}\n#{skill.skill_level_description}"
  end

end

defmodule Run do

  defp update(state, _field, value) when value in [nil, ""], do: state
  defp update(state, field, value), do: Map.put(state, field, value)

  def run do
    {map, _state} =
      Path.join(__DIR__, "seeds.csv")
      |> File.stream!()
      |> CSV.decode!(headers: true, escape_max_lines: 200)
      |> Enum.reduce({%{}, %Level{}}, fn row, {map, state} ->
          state = update(state, :family_name, String.trim(row["Role Family"]))
          state = update(state, :role_name, String.trim(row["Role"]))
          state = update(state, :role_description, String.trim(row["Role Description"]))
          state = update(state, :level_name, String.trim(row["Role Level"]))
          state = update(state, :level_description, String.trim(row["Role Level Description"]))
          skill = %Skill{
            skill_name: row["Skill Name"],
            skill_description: row["Skill Description"],
            skill_level_name: row["Skill Level"],
            skill_level_description: String.replace(row["Skill Level Description"], ~r"^You can:\n", "")
          }
          k = Level.slug(state)
          map = if Map.has_key?(map, k) do
            map
          else
            Map.put(map, k, Level.to_string(state))
          end
          map = if !Skill.complete?(skill) do
            map
          else
            Map.put(map, k, Map.get(map, k) <> Skill.to_string(skill))
          end
          {map, state}
        end)

    Enum.each(map, fn {key, value} ->
      File.write("uk-gdad-pcf-roles-#{key}.txt", value)
    end)

  end
end

Run.run

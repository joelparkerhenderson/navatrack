defmodule Mix.Tasks.UpdateDepsVersions do
  use Mix.Task

  @shortdoc "Updates dependency versions in mix.exs to latest available versions"
  @moduledoc """
  Updates dependency versions in mix.exs file.

  ## Usage

      mix update_versions

  ## Options

    * `--dry-run` - Show what would be updated without making changes
    * `--backup` - Create a backup of mix.exs before updating (default: true)
    * `--no-backup` - Skip creating backup

  ## Examples

      # Update all dependencies
      mix update_versions

      # See what would be updated without making changes
      mix update_versions --dry-run

      # Update without creating backup
      mix update_versions --no-backup
  """

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start")

    {opts, _} = OptionParser.parse!(args,
      switches: [dry_run: :boolean, backup: :boolean, no_backup: :boolean],
      aliases: [d: :dry_run]
    )

    dry_run = Keyword.get(opts, :dry_run, false)
    create_backup = !Keyword.get(opts, :no_backup, false) && Keyword.get(opts, :backup, true)

    if dry_run do
      Mix.shell().info("🔍 Running in dry-run mode - no changes will be made")
    end

    try do
      update_dependencies(dry_run, create_backup)
    rescue
      e ->
        Mix.shell().error("❌ Error updating dependencies: #{Exception.message(e)}")
        exit({:shutdown, 1})
    end
  end

  defp update_dependencies(dry_run, create_backup) do
    # Get outdated dependencies
    Mix.shell().info("🔍 Checking for outdated dependencies...")
    outdated_deps = get_outdated_dependencies()

    if Enum.empty?(outdated_deps) do
      Mix.shell().info("✅ All dependencies are up to date!")
    else

    Mix.shell().info("📦 Found #{length(outdated_deps)} outdated dependencies:")
    Enum.each(outdated_deps, fn {name, current, latest} ->
      Mix.shell().info("  • #{name}: #{current} → #{latest}")
    end)

      if dry_run do
        Mix.shell().info("🔍 Dry run complete - no changes made")
      else

        # Create backup if requested
        if create_backup do
          create_mix_backup()
        end

        # Read and update mix.exs
        Mix.shell().info("📝 Updating mix.exs...")
        mix_content = File.read!("mix.exs")
        updated_content = update_mix_content(mix_content, outdated_deps)

        # Write updated content
        File.write!("mix.exs", updated_content)

        Mix.shell().info("✅ Successfully updated #{length(outdated_deps)} dependencies in mix.exs")
        Mix.shell().info("🔄 Run 'mix deps.get && mix compile' to fetch and compile new versions")
      end
    end
  end

  defp get_outdated_dependencies do
    case System.cmd("mix", ["hex.outdated", "--format", "csv"], stderr_to_stdout: true) do
      {output, 0} ->
        parse_outdated_output(output)
      {error, _} ->
        Mix.shell().error("Failed to get outdated dependencies: #{error}")
        []
    end
  end

  defp parse_outdated_output(output) do
    output
    |> String.split("\n")
    |> Enum.drop(1)  # Skip CSV header
    |> Enum.filter(&(&1 != ""))
    |> Enum.map(&parse_outdated_line/1)
    |> Enum.filter(& &1)  # Remove nils
  end

  defp parse_outdated_line(line) do
    case String.split(line, ",") do
      [name, current, latest, "Update possible" | _] ->
        {String.trim(name), String.trim(current), String.trim(latest)}
      [name, current, latest, "Update not possible" | _] ->
        Mix.shell().info("⚠️  Cannot update #{name}: #{current} (latest: #{latest})")
        nil
      _ ->
        nil
    end
  end

  defp create_mix_backup do
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601(:basic) |> String.replace(":", "")
    backup_name = "mix.exs.backup.#{timestamp}"
    File.copy!("mix.exs", backup_name)
    Mix.shell().info("💾 Created backup: #{backup_name}")
  end

  defp update_mix_content(content, outdated_deps) do
    Enum.reduce(outdated_deps, content, fn {name, current, latest}, acc ->
      update_dependency_version(acc, name, current, latest)
    end)
  end

  defp update_dependency_version(content, name, current, latest) do
    # Handle various dependency formats
    patterns = [
      # {:dep, "~> 1.0"}
      ~r/{:#{Regex.escape(name)},\s*"~>\s*#{Regex.escape(current)}"}/,
      # {:dep, "~> 1.0", opts}
      ~r/{:#{Regex.escape(name)},\s*"~>\s*#{Regex.escape(current)}",\s*([^}]+)}/,
      # {:dep, ">= 1.0"}
      ~r/{:#{Regex.escape(name)},\s*">=\s*#{Regex.escape(current)}"}/,
      # {:dep, "== 1.0"}
      ~r/{:#{Regex.escape(name)},\s*"==\s*#{Regex.escape(current)}"}/,
      # {:dep, "1.0"}
      ~r/{:#{Regex.escape(name)},\s*"#{Regex.escape(current)}"}/
    ]

    replacements = [
      "{:#{name}, \"~> #{latest}\"}",
      "{:#{name}, \"~> #{latest}\", \\1}",
      "{:#{name}, \">= #{latest}\"}",
      "{:#{name}, \"== #{latest}\"}",
      "{:#{name}, \"#{latest}\"}"
    ]

    patterns
    |> Enum.zip(replacements)
    |> Enum.reduce_while(content, fn {pattern, replacement}, acc ->
      if Regex.match?(pattern, acc) do
        new_content = Regex.replace(pattern, acc, replacement)
        Mix.shell().info("  ✓ Updated #{name}: #{current} → #{latest}")
        {:halt, new_content}
      else
        {:cont, acc}
      end
    end)
    |> case do
      ^content ->
        Mix.shell().info("  ⚠️  Could not find dependency pattern for #{name}")
        content
      updated ->
        updated
    end
  end
end

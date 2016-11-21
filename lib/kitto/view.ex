defmodule Kitto.View do
  @templates_dir Application.get_env :kitto, :templates_dir, "dashboards"
  @default_layout Application.get_env :kitto, :default_layout, "layout"

  @doc """
  Returns the EEx compiled output of the template specified
  """
  def render(template) do
    @default_layout |> path |> EEx.eval_file([template: render_template(template)])
  end

  @doc """
  Returns true if the given template exists in the templates directory
  """
  def exists?(template), do: template |> path |> File.exists?

  defp render_template(template), do: template |> path |> EEx.eval_file
  defp path(template), do: Path.join templates_path, "#{template}.html.eex"
  defp templates_path, do: Path.join System.cwd, @templates_dir
end

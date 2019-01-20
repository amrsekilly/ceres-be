defmodule Ceres.External.Slack do
  @moduledoc """
  Handles interactions with Slack's API.
  """

  @type request_success :: {:ok, Poison.Parser.t()}
  @type error :: {:error, String.t()}

  @spec send_url :: String.t()
  defp send_url do
    root_url() <> "/" <> channel_id() <> "/"
  end

  @spec channel_id :: String.t()
  defp channel_id do
    config() |> Keyword.get(:channel_id, "")
  end

  @spec root_url :: String.t()
  defp root_url do
    config() |> Keyword.get(:root_url, "")
  end

  @spec config :: Keyword.t()
  defp config do
    Application.get_env(:itk, __MODULE__, Keyword.new())
  end
end

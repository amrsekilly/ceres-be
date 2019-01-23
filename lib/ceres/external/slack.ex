defmodule Ceres.External.Slack do
  @moduledoc """
  Handles interactions with Slack's API.
  """

  @type request_success :: {:ok, Poison.Parser.t()}
  @type error :: {:error, String.t()}

  # GET https://slack.com/api/oauth.access?client_id=CLIENT_ID&client_secret=CLIENT_SECRET&code=XXYYZZ
  def getSlackOauth(code) do
    data = [
      {:client_id, System.get_env("SLACK_CLIENT_ID")},
      {:client_secret, System.get_env("SLACK_CLIENT_SECRET")},
      {:code, code}
    ]

    headers = [{"Content-Type", "application/x-www-form-urlencoded"}]

    case HTTPoison.post("https://slack.com/api/oauth.access", {:form, data}, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Resource Not found!")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end
end

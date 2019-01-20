defmodule Ceres.External.Slack do
  @moduledoc """
  Handles interactions with Slack's API.
  """

  @type request_success :: {:ok, Poison.Parser.t()}
  @type error :: {:error, String.t()}

  # GET https://slack.com/api/oauth.access?client_id=CLIENT_ID&client_secret=CLIENT_SECRET&code=XXYYZZ
  def getSlackOauth(code) do
    headers = ["client_id": System.get_env("SLACK_CLIENT_ID"), "client_secret": System.get_env("SLACK_CLIENT_SECRET"), "code": code]
    case HTTPoison.get("https://slack.com/api/oauth.access", headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.inspect "---------------------------------"
        IO.inspect "---------------------------------"
        IO.inspect "---------------------------------"
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end

defmodule CeresWeb.JsonHelpers do
  @moduledoc """
  Provides helpers for formatting responses in the standard ITK response format.

  The response format is

  ```
  {
    "code": 200,
    "status": "success",
    "data": [],
    "message": ""
  }
  ```

  Possible values for "status" are "success" and "failure".
  """

  def format_json_response(code \\ 200, _)

  def format_json_response(code, message) when is_binary(message) do
    format_json_response(code, [], message)
  end

  def format_json_response(code, data) do
    format_json_response(code, data, "")
  end

  def format_json_response(status, data, message) when is_atom(status) do
    status
    |> Plug.Conn.Status.code()
    |> format_json_response(data, message)
  end

  def format_json_response(code, data, message) do
    status =
      if code in 200..299 do
        "success"
      else
        "failure"
      end

    %{
      code: code,
      status: status,
      data: List.wrap(data),
      message: message
    }
  end
end

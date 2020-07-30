defmodule TimestampMicroserviceElixirWeb.TimestampController do
  use TimestampMicroserviceElixirWeb, :controller

  def show(conn, %{"date" => date}) do
    case Date.from_iso8601(date) do
      {:ok, %Date{}} ->
        conn
        |> put_status(:ok)
        |> get_current_date_time(date)

      {:error, :invalid_format} ->
        conn
        |> put_status(:bad_request)
        |> json(%{error: "Not a valid ISO-8601 format date"})

      {:error, :invalid_date} ->
        conn
        |> put_status(:bad_request)
        |> json(%{error: "Not a valid date"})
    end
  end

  def get_current_date_time(conn, date) do
    current_time = Time.to_string(Time.utc_now())
    full_date_time_iso8601 = "#{date} #{current_time}"
    {:ok, naive_datetime} = NaiveDateTime.from_iso8601(full_date_time_iso8601)
    {:ok, datetime} = DateTime.from_naive(naive_datetime, "Etc/UTC")
    json(conn, %{unix: DateTime.to_unix(datetime)})
  end
end

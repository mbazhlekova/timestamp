defmodule TimestampMicroserviceElixirWeb.TimestampController do
  use TimestampMicroserviceElixirWeb, :controller

  def show(conn, %{"date" => date}) do
    current_time = Time.to_string(Time.utc_now)
    full_date_time = "#{date} #{current_time}"
    json(conn, %{time: full_date_time})
  end
end

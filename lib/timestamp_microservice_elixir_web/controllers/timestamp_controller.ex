defmodule TimestampMicroserviceElixirWeb.TimestampController do
  use TimestampMicroserviceElixirWeb, :controller

  def show(conn, %{"date" => date}) do
    json(conn, %{message: date})
  end
end

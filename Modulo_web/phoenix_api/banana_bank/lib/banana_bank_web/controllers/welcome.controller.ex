defmodule BananaBankWeb.WelcomeController do
  use BananaBankWeb, :controller


  def index(connection, _params) do
    # IO.inspect(connection)
    # IO.inspect(params)
    connection
    |> put_status(:ok)
    |> json(%{message: "Hellow World", status: :ok} )

  end

end

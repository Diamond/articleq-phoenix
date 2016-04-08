defmodule Articleq.SessionController do
  use Articleq.Web, :controller

  alias Articleq.User

  def create(conn, %{"username" => username, "password" => password}) do
    case Repo.get_by(User, %{username: username}) do
      nil ->
        login_failed(conn)
      user ->
        if Comeonin.Bcrypt.checkpw(password, user.encrypted_password) do
          {:ok, token, _} = Guardian.encode_and_sign(user, :api)
          json(conn, %{token: token})
        else
          login_failed(conn)
        end
    end
  end

  defp login_failed(conn) do
    conn
    |> json(%{errors: ["Invalid username/password combination!"]})
    |> halt
  end
end

defmodule Articleq.PageController do
  use Articleq.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

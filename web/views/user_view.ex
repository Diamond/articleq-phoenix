defmodule Articleq.UserView do
  use Articleq.Web, :view
  use JaSerializer.PhoenixView

  attributes [:username, :email]
end

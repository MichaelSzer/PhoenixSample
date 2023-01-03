defmodule PhoenixSampleWeb.PageView do
  use PhoenixSampleWeb, :view

  @doc """
  Functional component for form section headers.

  Required assigns:
  - @title

  Optional assigns:
  - @classes


  ## Example
        <PhoenixSampleWeb.PageView.form_section title={"User Information"} classes={"text-red-500"} />
  """
  def form_section(assigns) do
    classes = if assigns[:classes], do: assigns.classes, else: ""

    assigns =
      assigns
      |> assign(:classes, classes)

    ~H"""
    <p class={"#{@classes} text-xl font-bold mt-6"}>
      <%= @title %>
    </p>
    """
  end
end

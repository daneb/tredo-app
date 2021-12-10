require "tredo"

class TodoComponent::Todo
  include ActiveRecord::Model

  def open_lists
    ["Car", "house"]
  end
end

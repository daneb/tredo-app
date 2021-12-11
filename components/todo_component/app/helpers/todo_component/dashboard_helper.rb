require "tredo"

module TodoComponent
  module DashboardHelper
    def todo_lists
      response = JSON.parse(Tredo.todo_lists)
      if response["status"] == "success"
        return JSON.parse(response["data"]["result"])
                 .select { |todo| todo["closed"] == false }
                 .map { |todo| [todo["id"], todo["name"]] }
      end
      []
    end

    def todos_by_list(id)
      response = Rails.cache.fetch("/dashboard/#{id}", expires_in: 10.minutes) do
        JSON.parse(Tredo.todos_for_list(id))
      end
      result = JSON.parse(response["data"]["result"]) if response["status"] == "success"
      return result.map { |a| [a["id"], a["name"]] }

      []
    end

    def create_a_todo(name)
      response = JSON.parse(Tredo.create_todo(name))
      if response["status"] == "success"
        return JSON.parse(response["data"]["result"])
      end
      []
    end
  end
end

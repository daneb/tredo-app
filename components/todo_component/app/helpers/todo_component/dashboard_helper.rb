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
      response = JSON.parse(Tredo.todos_for_list(id))
      if response["status"] == "success"
        return JSON.parse(response["data"]["result"])
                 .map { |a| [a["data"]["card"]["id"], a["data"]["card"]["name"]] }
      end
    end

    []
  end
end

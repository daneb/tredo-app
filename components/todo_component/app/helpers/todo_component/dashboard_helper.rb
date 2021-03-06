require "tredo"

module TodoComponent
  module DashboardHelper
    TOKEN = Rails.application.credentials.trello[:token]
    KEY = Rails.application.credentials.trello[:key]

    def todo_lists
      response = JSON.parse(Tredo.todo_lists(TOKEN, KEY))
      if response["status"] == "success"
        return JSON.parse(response["data"]["result"])
                 .select { |todo| todo["closed"] == false }
                 .map { |todo| [todo["id"], todo["name"]] }
      end
      []
    end

    def todos_by_list(id)
      response = JSON.parse(Tredo.todos_for_list(id, TOKEN, KEY))
      result = JSON.parse(response["data"]["result"]) if response["status"] == "success"
      return result.map { |a| [a["id"], a["name"]] }

      []
    end

    def create_a_todo(name)
      response = JSON.parse(Tredo.create_todo(name, TOKEN, KEY))
      if response["status"] == "success"
        return JSON.parse(response["data"]["result"])
      end
      []
    end
  end
end

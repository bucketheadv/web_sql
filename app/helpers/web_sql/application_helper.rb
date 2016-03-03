module WebSql
  module ApplicationHelper
    def format_time(string)
      begin
        DateTime.parse(string).strftime("%Y-%m-%d %H:%M:%S")
      rescue 
        string
      end
    end
  end
end

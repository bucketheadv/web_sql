Rails.application.routes.draw do

  mount WebSql::Engine => "/web_sql"
end

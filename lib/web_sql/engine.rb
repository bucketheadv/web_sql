module WebSql
  class Engine < ::Rails::Engine
    isolate_namespace WebSql
    initializer 'web_sql.gen_models' do |app|
      WebSql::Model.gen_models
    end
  end
end

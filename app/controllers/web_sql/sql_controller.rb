require_dependency "web_sql/application_controller"

module WebSql
  class SqlController < ApplicationController
    def index
      if request.post?
        db = params[:db].to_s.strip
        sql = params[:sql].to_s.strip
        if sql_valid?(sql)
          begin
            klass = WebSql::Model.get_conn(db)
            if klass.nil?
              db = 'default'
              klass = ActiveRecord::Base
            end
            @results = klass.connection.exec_query(set_limit(sql))
          rescue ActiveRecord::StatementInvalid => e
            flash.now[:error] = "Using database: #{db}, errors: #{e.message}"
          end
        else
          flash.now[:error] = "Using database: #{db}, SQL syntax error."
        end
      end
    end

    protected
    def sql_valid?(sql)
      sql = sql.to_s.strip
      return true if sql =~ /^(?:select|show|explain|desc)/i
      false
    end

    def set_limit(sql)
      if sql =~ /^select/i && sql !~ /limit/i
        sql = sql.sub(/(;+)?$/, ' LIMIT 1000')
      end
      sql
    end
  end
end

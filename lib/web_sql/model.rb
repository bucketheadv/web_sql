module WebSql
  class Model
    class << self
      def databases
        config_file = Rails.root.join("config/web_db.yml")
        if File.exist?(config_file)
          config = YAML.load(ERB.new(File.open(config_file).read()).result).with_indifferent_access
          return config[Rails.env] || {}
        end
        {}
      end
      def gen_models
        @connections = {}
        databases.each do |database, config|
          db = database.to_s.strip
          begin
            class_name = db.classify
            klass = WebSql::Model.const_set(class_name, Class.new(ActiveRecord::Base))
            klass.class_eval do 
              self.establish_connection(config)
            end
            @connections[db] = klass
          rescue StandardError => _
            @connections[db] = nil
          end
        end
        @connections
      end

      def get_conn(db)
        @connections ||= {}
        @connections[db]
      end
    end
  end
end

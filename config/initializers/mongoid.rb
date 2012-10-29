# if mongo-config is necessary, do it here
module A64
  class Application
    Mongoid.logger.level = Logger::WARN
    Moped.logger.level = Logger::WARN
  end
end

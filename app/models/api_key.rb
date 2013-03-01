class ApiKey < ActiveRecord::Base
  attr_accessible :token, :name
end

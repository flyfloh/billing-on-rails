class Company < ActiveRecord::Base
  include Singleton

  def self.instance
    find_by_id(1)
  end
end

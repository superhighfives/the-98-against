class Politician < ActiveRecord::Base
  validates_uniqueness_of :pid
end
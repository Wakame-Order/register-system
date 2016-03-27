class User < ActiveRecord::Base
  has_many :friends
  has_many :time_tables
  has_one :profile
end

class Template < ActiveRecord::Base
  validates :name, uniqueness: true
end

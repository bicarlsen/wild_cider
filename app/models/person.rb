class Person < ActiveRecord::Base
	validates :name, presence: true
	validates :position, presence: true

end

class Recipe < ActiveRecord::Base
	scope :sorted, lambda { order("recipes.created_at DESC") }
end

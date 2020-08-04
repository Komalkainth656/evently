class Event < ApplicationRecord
    before_validation : default_price
    DEFAULT_PRICE = 0 
    def default_price
        self.price ||= DEFAULT_PRICE
      end
    validates(:title,
        presence: true,
        uniqueness: true,
      )
end

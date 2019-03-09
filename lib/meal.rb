require 'pry'

class Meal

    #JOIN MODEL
    attr_accessor :waiter, :customer, :total, :tip

    @@all = []

    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip

        @@all << self
    end

    def self.all
        @@all
    end

    binding.pry
end

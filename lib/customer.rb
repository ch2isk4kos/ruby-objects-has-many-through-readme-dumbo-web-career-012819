class Customer

    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age

        @@all << self
    end

    def self.all
        @@all
    end

	def meals
        Meal.all.select do |meal|
            meal.customer == self
        end
    end

	def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

	def	meal_prices
		meals.map do |meal|
			cost = meal.total + meal.tip
			puts "$#{meal.total} + Tip: $#{meal.tip}"
			"You're total is: $#{cost}"
		end
	end

	def waiters
		meals.map do |meal|
			"#{meal.waiter.name}"
		end
	end

	def new_meal_20_percent(waiter, total)
    	tip = total * 0.2
    	Meal.new(waiter, self, total, tip)
  	end

  	def self.oldest_customer
    	oldest_age = 0
    	oldest_customer = nil

		self.all.each do |customer|
      		if customer.age > oldest_age
        		oldest_age = customer.age
        		oldest_customer = customer
      		end
    	end
    	"#{oldest_customer.name.capitalize}: #{oldest_customer.age}"
  	end

	# def self.youngest_customer
    # 	youngest_age = 0
    # 	youngest_customer = nil
    #
	# 	self.all.each do |customer|
    #   		if customer.age > youngest_customer && customer.age < self.oldest_customer
    #     		youngest_age = customer.age
    #     		youngest_customer = customer
    #   		end
    # 	end
    # 	"#{youngest_customer.name.capitalize}: #{youngest_customer.age}"
  	# end

end

class Waiter

    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience

        @@all << self
    end

    def self.all
        @@all
    end

	def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

	def	meal_prices
		meals.map do |meal|
			cost = meal.total + meal.tip
			puts "$#{meal.total} + Tip: $#{meal.tip}"
			"You're total is: $#{cost}"
		end
	end

	def tips
		sum = 0
		meals.each do |meal|
			sum += meal.tip
			puts "#{meal.customer.name}: $#{meal.tip}"
		end
		"Tips: $#{sum}"
	end
end

module StatusesHelper

	def icon_chooser(status)
		attributes = ["wheat", "dairy", "meat", "coffee_cups", "exercise"]

		icons = attributes.collect do |attribute|
			attribute if (status.send(attribute) && attribute != "coffee_cups")
		end

		status.send("coffee_cups").times { icons << "coffee_cups"}
		
		icons.compact
	end

end


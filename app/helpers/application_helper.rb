module ApplicationHelper
	def formatted_address(address)
		"#{address[:detail]} #{address[:town]} #{address[:city]} #{address[:country]}"
	end
end

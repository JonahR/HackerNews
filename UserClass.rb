class User < HackerNews
	attr_reader :your_posts
	def initialize(username)
		@username = username
		puts "You have succesfully created account: #{@username}"
		@your_posts = []
	end

	def post(post) 
		super
		@your_posts << post
		puts "You have succesfully posted: #{post}"
	end

	def list_my_posts
		puts "Here is a list of all my posts:"
		puts @your_posts
	end

	def delete_post(post)
		@your_posts.each do |individual|
			if individual == post
				@your_posts.delete(post)
				puts "You have succesfully deleted post: #{post}"
				super
			else
				puts "I don't recognize that posts. Type 'delete' to try again."
			end

		end
	end
end
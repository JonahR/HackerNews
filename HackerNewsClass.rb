class HackerNews
	HOMEPAGE =[]
	ACCOUNTS = []
	ACCOUNTASOBJECTS = []
	def create_account(username)
		ACCOUNTS << username
	end

	def accounts_as_objects(accounts)
		ACCOUNTASOBJECTS << accounts
	end

	def list_accounts()
		puts ACCOUNTS
	end

	def post(post)
		HOMEPAGE << post
	end

	def HackerNews.list_posts()
		puts "Here is a list of the posts: "
		puts HOMEPAGE
	end

	def switch_account(account)
		ACCOUNTS.each do |user|
			if account == user
				return ACCOUNTS.index(user)
			end
		end
	end

	def final_switch(number)
		return ACCOUNTASOBJECTS[number]
	end

	def HackerNews.check_if_unique(account)
		ACCOUNTS.each do |name|
			if account == name
				puts "Sorry that account has been taken"
				return false
			else
				return true
			end
		end
	end

	def delete_post(post)
		HOMEPAGE.each do |individual|
			if individual == post
				HOMEPAGE.delete(post)
			end
		end
	end
end


require_relative 'HackerNewsClass'
require_relative 'UserClass'

print "Welcome to HackerNews. What whould you like to do today?(Type 'h' for help) \n"
$account_logged_in = false

while true
	option = gets.chomp.downcase
	case option
	when "h"
		help = File.read("help.txt")
		puts help
		puts ""
	when "create account"
		puts "What would you like you userername to be?"
		username = gets.chomp
		if HackerNews.check_if_unique(username)
			text_username = username
			username = User.new(username)
			username.create_account(text_username)
			$account_logged_in = username
			$account_logged_in.accounts_as_objects($account_logged_in)
		end
		puts ""
	when "list accounts"
		if $account_logged_in != false	
			puts "Here is a list of the active accounts:"
			$account_logged_in.list_accounts
			puts ""
		else
			puts "Create an account to see other accounts"
		end
	when "post"
		if $account_logged_in != false
			puts "Enter your post:"
			text = gets.chomp
			$account_logged_in.post(text)
			puts ""
		else
			puts "Create an account to Post"
			puts ""
		end
	when "list posts"
		HackerNews.list_posts
		puts ""
	when "list my posts"
		if $account_logged_in != false	
			$account_logged_in.list_my_posts()
			puts ""
		else
			puts "Create an account to see your posts"
			puts ""
		end
	when "exit"
		break
	when "delete"	
		if $account_logged_in != false
			puts "What post whould you like to delete:"
			puts $account_logged_in.list_my_posts
			post_to_delete = gets.chomp
			$account_logged_in.delete_post(post_to_delete)
			puts ""
		else
			puts "Create an account to delete"
			puts ""
		end
		
	when "switch accounts"
		if $account_logged_in != false	
			puts "What account would you like to log into?"
			new_account = gets.chomp
			if  $account_logged_in.switch_account(new_account) != Integer
				var = $account_logged_in.switch_account(new_account)
				$account_logged_in = $account_logged_in.final_switch(var)
				puts ""
			else
				puts "I didn't recognize that username."
				puts ""
			end
		else
			puts "Create an account to switch accounts"
			puts ""
		end
		
	else
		puts "I'm sorry I did not recognize that."
		puts ""
		loop
	end
end

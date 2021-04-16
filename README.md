Ruby on Rails Learning path

This repo is meant to be a sandbox to learn the Rails framework.
The source code generated in this repo is a result of initializing
a default Rails application using the 'rails' command line tool,
and following the guide found at https://guides.rubyonrails.org/getting_started.html .


The app was initialized using

	rails new blog

The following are some key aspects of the app:

	* Ruby version

		ruby-2.7.2

	* Configuration

		The app uses bundler to manage all of its dependencies.
		Uses the routes.rb file convention to define all the routes
		that expose controller actions in this app.

		This project must use postgresql in order to be able to run
		on heroku.

	* Database creation

		This application runs on postgresql. The database.yml
		has to be edited to recieve the local credentials of the running
		postgresql instance, because it was configured to run
		on heroku.

	* Database initialization

		The command 'rails db:schema:load' was used to load all the
		objects to the database.

	* Deployment instructions

		When deployed on heroku:

			- Create heroku app whilst standing in the app root folder.
			(The whole app must be contained in the root directory, otherwise,
				heroku will fail to recognize the app as a valid ruby app)

				The command used to create a heroku app is:

						heroku create
			- The project must be pushed to heroke using:

				git push heroku master

			- Once the project has been deployed to heroku, the database
			must be initialized because the tables will not be created automatically.
			This is done loading the schema file using the following command

			heroku run rails db:schema:load

			Note that 'heroku run' must be prepended to the command to tell the
			system to send the command to heroku for execution.

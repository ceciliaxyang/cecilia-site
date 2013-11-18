class SiteController < ApplicationController
	def index
	end

	def about
	end

	def work
		@projects = find_all_projects_by_type(WORK_PROJECT)
	end

	def labs
		@projects = find_all_projects_by_type(LABS_PROJECT)
	end

	def project_page
		@projects = find_project_by_title(params[:title])
	end



	# Controller

	WORK_PROJECT = 1
	LABS_PROJECT = 2


	# Model
	private

	def projects
		[
		{:title => "OKL Search", 
		 :body => "Text about OKL Search",
		 :type => WORK_PROJECT},
		{:title => "Jawbone Mobile Site", 
		 :body => "Text about Jawbone Mobile Site",
		 :type => WORK_PROJECT},
		{:title => "Name that Cloud", 
		 :body => "Text about Cloud Project",
		 :type => LABS_PROJECT},
		{:title => "Cloud", 
		 :body => "Text about Cloud Project",
		 :type => LABS_PROJECT}
	]
	end

	def find_project_by_title(title)
		projects.each do |p|
			if p[:title] == title
				return p
			end
		end
	end

	def find_all_projects_by_type(type)
		results = []
		projects.each do |p|
			if p[:type] == type
				results << p
			end
		end
		return results
	end

end




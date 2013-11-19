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
		@projects = find_project_by_title(params[:name])
	end



	# Controller

	WORK_PROJECT = 1
	LABS_PROJECT = 2


	# Model
	private

	def projects
		[
		{:name => "okl-search",
		 :title => "Search & Faceted Filters",
		 :company => "One Kings Lane",
		 :description => "Search, Null Results, and Faceted Filters",
		 :role => "Interaction Design",
		 :year => "2013",
		 :body => "Any description here",
		 :type => WORK_PROJECT},

		{:name => "okl-categories",
		 :title => "Category-based Shopping",
		 :company => "One Kings Lane",
		 :description => "Description here",
		 :role => "Interaction Design",
		 :year => "2013",
		 :body => "Any description here",
		 :type => WORK_PROJECT},

		{:name => "okl-ipad-app",
		 :title => "iPad App 1.0",
		 :company => "One Kings Lane",
		 :description => "Description here",
		 :role => "Interaction Design",
		 :year => "2013",
		 :body => "Any description here",
		 :type => WORK_PROJECT},

		{:name  => "jawbone-mobile", 
		 :title => "Mobile Site",
		 :company => "Jawbone",
		 :body => "Text about Jawbone Mobile Site",
		 :type => WORK_PROJECT},

		{:name  => "jawbone-up-ipad-app", 
		 :title => "Point-of-Sale iPad App",
		 :company => "Jawbone",
		 :body => "Text",
		 :type => WORK_PROJECT},

		{:name  => "name-that-cloud",
		 :title => "Search on One Kings Lane", 
		 :body => "Text about Cloud Project",
		 :type => LABS_PROJECT}
	]
	end

	def find_project_by_title(title)
		projects.each do |p|
			if p[:name] == title
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

	def project_type_string(value)
		if value = WORK_PROJECT
			return 'work'
		end
		if value = LABS_PROJECT
			return 'labs'
		end
	end

	helper_method :project_type_string


end




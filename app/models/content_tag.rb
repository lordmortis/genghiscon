class ContentTag < ActiveRecord::Base
	has_many :taglinks, :class_name => "ContentTagBlock", :foreign_key => "content_tag_id"
	has_many :blocks, :class_name => "ContentBlock", :through => :taglinks, :order => ["updated_at desc"]
	has_many :pages, :class_name => "ContentPage", :foreign_key => "content_tag_id"

	def before_update
		self.name = name.downcase
	end

	def page?
		if pagename 
			return "yes"
		else
			return "no"
		end
	end
end

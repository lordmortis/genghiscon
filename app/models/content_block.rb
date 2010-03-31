class ContentBlock < ActiveRecord::Base
	has_paper_trail
	
	belongs_to :editor, :class_name => "User"
	belongs_to :author, :class_name => "User"

	has_many :taglinks, :class_name => "ContentTagBlock", :foreign_key => "content_block_id"
	has_many :tags, :class_name => "ContentTag", :through => :taglinks

	
	default_scope :order => "created_at desc"
	
	attr_accessible :summary, :bodytext, :autosummarize, :tag_list
		
	def tag_list(html = false)
		value = ""
		for tag in tags
			if html and tag.pagename
				value += "<b>"
			end
			value += tag.name
			if html and tag.pagename
				value += "</b>"
			end
			value += ", "
		end
		if value != ""
			value = value[0..-3]
		end
		
		value
	end
	
	def tag_list=(value)
		list = value.split(",")
		newlist = []
		for item in list
			newlist << item.strip
		end
		
		list = newlist

		for taglink in taglinks
			if !list.include?(taglink.tag.name)
				taglink.destroy
			else
				list.delete(taglink.tag.name)
			end
		end
		
		for newtag in list
			atag = ContentTag.find_by_name(newtag)
			if atag == nil
				atag = ContentTag.new(:name => newtag)
				atag
			end
			
			tags << atag
			
		end
	end
		
	def before_update
		if autosummarize 
			do_autosummarize
		end
	end
	
	def do_autosummarize
		if bodytext.size <= 160
			self.summary = bodytext
		else
			self.summary = bodytext[0..156] + "..."
		end
	end
end

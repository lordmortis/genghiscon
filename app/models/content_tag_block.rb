class ContentTagBlock < ActiveRecord::Base
	belongs_to :block, :class_name => "ContentBlock", :foreign_key => "content_block_id"
	belongs_to :tag, :class_name => "ContentTag", :foreign_key => "content_tag_id"
end

require 'active_support/concern'

module Commentable
	extend ActiveSupport::Concern

	included do
		before_filter :comments, :only => [:show]
	end

	def comments
		@commentable = find_commentable
		@comments = @commentable.comments.order('created_at')
		@comment = Comment.new
	end

	private

	def find_commentable
		params[:controller].singularize.classify.constantize.find(params[:id])
	end

end


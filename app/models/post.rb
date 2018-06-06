class Post < ApplicationRecord
  attr_reader :feed,:blog_title
  ATTRIBUTE_NAMES=[:title, :link, :published, :description, :content, :author]

  class << self
    def feed
      @feed ||= FeedParser.new(:url => "http://yqwoe.space/feed.xml").parse
    end

    def blog_title
      @blog_title ||= feed.title
    end

    def last_post
      @post = Post.find_by_title(feed.items.first.title)
      if @post.nil?
        post_hash = feed.items.first
        @post = Post.new(post_hash.as_json.select {|k,v| Post.attribute_names.include?(k.to_s)})
        @post.categories = post_hash.categories.to_s
        @post.item = post_hash.as_json.to_json
        @post.save!
      end
      @post
    end
  end

end

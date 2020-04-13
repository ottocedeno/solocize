module Slugify

  module InstanceMethods
    
    def slug
      clear_punctuation.downcase.gsub(" ","-")
    end

    private
    def clear_punctuation
      name.gsub(/[,!?.]/, "")
    end   
  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.find{|i| i.slug == slug}
    end

  end
end
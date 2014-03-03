module PolymorphicRender
  module ApplicationHelper
    def polymorphic_render(resource, suffix = nil)
      if resource.is_a? ActiveRecord::Base
        path = [resource.to_partial_path, suffix.presence].compact.join('_')
        name = File.basename(resource.to_partial_path)
        render partial: path, object: resource, as: name
      else
        capture do
          resource.each{ |res| concat polymorphic_render(res, suffix) }
        end
      end
    end
  end
end

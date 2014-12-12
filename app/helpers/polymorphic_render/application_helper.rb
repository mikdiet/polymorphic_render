module PolymorphicRender
  module ApplicationHelper
    def polymorphic_render(resource, suffix = nil, options = {})
      if resource.is_a? ActiveRecord::Base
        path = [resource.to_partial_path, *Array(suffix)].select(&:present?).join('_')
        name = File.basename(resource.to_partial_path)
        render options.merge(partial: path, object: resource, as: name)
      else
        capture do
          resource.each{ |res| concat polymorphic_render(res, suffix, options) }
        end
      end
    end
  end
end

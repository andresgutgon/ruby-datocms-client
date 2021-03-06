# frozen_string_literal: true
module Dato
  module Local
    module FieldType
      class Seo
        attr_reader :title, :description

        def self.parse(value, _repo)
          value && new(value[:title], value[:description], value[:image])
        end

        def initialize(title, description, image)
          @title = title
          @description = description
          @image = image
        end

        def image
          @image && Image.parse(@image, nil)
        end

        def to_hash(*args)
          {
            title: title,
            description: description,
            image: image && image.to_hash(*args)
          }
        end
      end
    end
  end
end

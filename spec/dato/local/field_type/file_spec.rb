# frozen_string_literal: true
require 'spec_helper'

module Dato
  module Local
    module FieldType
      RSpec.describe Dato::Local::FieldType::File do
        subject(:file) { described_class.parse(attributes, nil) }
        let(:attributes) do
          {
            path: '/foo.png',
            format: 'jpg',
            size: 4000
          }
        end

        it 'responds to path, format and size methods' do
          expect(file.path).to eq '/foo.png'
          expect(file.format).to eq 'jpg'
          expect(file.size).to eq 4000
        end

        it 'responds to url method' do
          expect(file.url(w: 300)).to eq 'https://www.datocms-assets.com/foo.png?w=300'
        end
      end
    end
  end
end

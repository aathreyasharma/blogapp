require 'rails_helper'

RSpec.describe Post, type: :model do
	context 'validation tests' do
		
		before :each do
			@file = fixture_file_upload('images/aaa.jpeg', 'image/jpeg')
		end
		it 'ensures title exists' do
			post = Post.new(image: @file, :text => "Blog Content").save
			expect(post).to eq(false)
		end
		it 'ensures text exists' do
			post = Post.new(title: 'Test', :image => @file).save
			expect(post).to eq(false)
		end
		it 'ensures image exists' do
			post = Post.new(title: "Test", :text => "Content").save
			expect(post).to eq(false)
		end

	end
end

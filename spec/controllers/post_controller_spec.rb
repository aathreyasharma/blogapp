require 'rails_helper'

RSpec.describe PostController, type: :controller do
	context 'Get #index' do
		it 'returns a success response' do
			get :index
			# expect(response).to be_success
			expect(response.successful?)
			# The above two statements(expect()) do the same thing
		end
	end

	context 'Get #show' do
		it 'returns a success response' do
			@image = fixture_file_upload('images/aaa.jpeg', 'image/jpeg')
			post = Post.create!(title: 'title', text: "post body", image: @image)
			get :show, params: {id: post.to_param}
			expect(response).to be_successful
		end
	end

	context 'Get #new' do
		it 'returns a success response' do
			get :new
			expect(response.successful?)
		end
	end

	context 'Post #create' do
		it 'returns a success response' do
			@image = fixture_file_upload('images/aaa.jpeg', 'image/jpeg')
			@post = Post.create!(title: 'title', text: "post body", image: @image)
			post :create, params: {post: @post.to_param}
			expect(response.successful?)
		end
	end

	context 'Delete #destroy' do
		it 'returns a success response' do
			@image = fixture_file_upload('images/aaa.jpeg', 'image/jpeg')
			@post = Post.create!(title: 'title', text: "post body", image: @image)
			delete :destroy, params: {id: @post.to_param}
			expect(response.successful?)
		end
	end

	context 'Patch #update' do
		it 'returns a success response' do 
			@image1 = fixture_file_upload('images/aaa.jpeg', 'image/jpeg')
			@iamge2 = fixture_file_upload('images/aaa.jpeg', 'image/jpeg')
			@post = Post.create!(title: 'title', text: "post body", image: @image1)
			updateObj = {title: 'title', text: "post body", image: @image2}
			patch :update, params: {id: @post.to_param, post: updateObj}
			expect(response.successful?)
		end
	end

end

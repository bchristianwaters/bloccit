require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
   let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:my_sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5) }

    describe "GET new" do
      it "returns http success" do
        get :new, params: { topic_id: my_topic.id }
        expect(response).to have_http_status(:success)
      end
 
      it "renders the #new view" do
        get :new, params: { topic_id: my_topic.id }
        expect(response).to render_template :new
      end
 
      it "instantiates @sponsored_post" do
        get :new, params: { topic_id: my_topic.id }
        expect(assigns(:sponsored_post)).not_to be_nil
      end
    end
 
    describe "POST create" do
      it "increases the number of Sponsored Post by 1" do
        expect{ post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5 } } }.to change(SponsoredPost,:count).by(1)
      end
 
      it "assigns the new post to @post" do
        post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5 } }
        expect(assigns(:sponsored_post)).to eq SponsoredPost.last
      end
 
      it "redirects to the new sponsored post" do
        post :create, params: { topic_id: my_topic.id, sponsored_post: { title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 5 } }
        expect(response).to redirect_to [my_topic, SponsoredPost.last]
      end
    end

   describe "GET show" do
     it "returns http success" do
       get :show, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
       expect(response).to have_http_status(:success)
     end
     it "renders the #show view" do
       get :show, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
       expect(response).to render_template :show
     end
 
     it "assigns my_sponsored_post to @sponsored_post" do
       get :show, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
       expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
     end
   end

   describe "GET edit" do
     it "returns http success" do
       get :edit, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #edit view" do
       get :edit, params: { topic_id: my_topic.id, id: my_sponsored_post.id }
       expect(response).to render_template :edit
     end
   end
   
   describe "PUT update" do

     it "redirects to the updated sponsored post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph
 
       put :update, params: { topic_id: my_topic.id, id: my_sponsored_post.id, sponsored_post: {title: new_title, body: new_body, price: 5 } }
       expect(response).to redirect_to [my_topic, my_sponsored_post]
     end
   end

end


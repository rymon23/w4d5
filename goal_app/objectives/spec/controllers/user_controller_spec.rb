require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    it 'renders the user index' do
      get(:index) # call http verb as method with an argument of controller :action
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      create(:user)
      get(:show, params: { id: User.last })
      expect(response).to render_template(:show)
    end
  end

    describe 'GET #new' do
      it 'brings up the form to create a user' do
        allow(subject).to receive(:logged_in?).and_return(true)
        get(:new)
        expect(response).to render_template(:new)
      end      
    end
end
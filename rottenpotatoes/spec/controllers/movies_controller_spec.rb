require 'spec_helper'
require 'rails_helper'
 
describe MoviesController do
  describe 'search for movies by director' do
    context 'with director'
      it 'should call the model method that performs search by director' do
        #Movie.should_receive(:search_by_director).with('George Lucas')
        expect(Movie).to receive(:search_by_director).with('George Lucas')
        get :similar, {:director => 'George Lucas'}
      end
      it 'should select the similar template for rendering' do
        Movie.stub(:search_by_director)
        get :similar, {:director => 'George Lucas'}
        expect(response).to render_template('similar')
      end
      it 'should make the movies with the same director available to the template' do
        fake_results = [double('Movie'), double('Movie')]
        Movie.stub(:search_by_director).and_return(fake_results)
        get :similar, {:director => 'George Lucas'}
        expect(assigns(:movies)).to eq(fake_results)
      end
    context 'without director' do
      it 'should redirect to homepage' do
        #expect(Movie).to receive(:search_by_director).with('')
        get :similar, {:director => ''}
        expect(response).to redirect_to(movies_path)
      end
      it 'should display the movie has no director info' do
        name = 'Alien'
        get :similar, {:director => '', :title => name}
        expect(flash[:notice]).to eq ("'#{name}' has no director info.")
      end
    
    end
  end
end

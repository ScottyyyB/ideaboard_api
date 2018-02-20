require 'rails_helper'

RSpec.describe Api::V1::IdeasController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  before do
    3.times { Idea.create(title: 'Gandalf', body: 'Is the freaking best!') }
  end

  describe 'GET /api/v1/ideas' do
    it 'should return all ideas' do
      get '/api/v1/ideas'
      expect(response.status).to eq 200
      expected_response = eval(file_fixture('ideas.txt').read)
      expect(response_json).to eq expected_response.as_json
    end
  end

  describe 'POST /api/v1/ideas' do
    it 'should create an idea' do
      post '/api/v1/ideas', params: {
        idea: {
          title: 'Gandalf', body: 'Shall pass' }
      }, headers: headers

      expect(response.status).to eq 200
      expect(response_json).to eq expected_response('idea_created.txt').as_json
    end
  end

  describe 'PUT /api/v1/ideas' do
    it 'should update a specific idea' do
      put "/api/v1/ideas/#{Idea.first.id}", params: {
        idea: {
          title: 'Gandalf', body: 'Is the best'
        }
      }, headers: headers

      expect(response.status).to eq 200
      expect(response_json).to eq expected_response('idea_updated.txt').as_json
    end
  end
end

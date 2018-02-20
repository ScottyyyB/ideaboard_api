require 'rails_helper'

RSpec.describe Api::V1::IdeasController, type: :request do
  before do
    3.times { Idea.create(title: 'Gandalf', body: 'Is the freaking best!') }
  end
  describe 'GET /api/v1/ideas' do
    it 'should return all ideas' do
      get '/api/v1/ideas'
      response_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expected_response = eval(file_fixture('ideas.txt').read)
      expect(response_json).to eq expected_response.as_json
    end
  end
end

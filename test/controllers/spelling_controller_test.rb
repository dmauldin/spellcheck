require 'test_helper'

# class SpellingControllerTest < ActionController::TestCase
describe SpellingController do
  describe 'with exact matching word' do
    before do
      get :show, word: 'dual'
    end

    it 'should return success response' do
      expect(response).must_be :success?
    end

    it 'should not return suggestions' do
      expect(JSON.parse(response.body)['suggestions']).must_be_nil
    end
  end

  describe 'with non-exact matching word' do
    before do
      get :show, word: 'dul'
    end

    it 'should return success response' do
      expect(response).must_be :success?
    end

    it 'should return suggestions' do
      expect(JSON.parse(response.body)['suggestions']).wont_be_empty
    end
  end

  test "returns 404 for non-existent words" do
    get :show, word: 'fsiuyflusyifys'
    expect(response).must_be :not_found?
  end

  test "returns 404 when word has a space" do
    get :show, word: 'bad word'
    expect(response).must_be :not_found?
  end

  test "returns 404 when word starts with a number" do
    get :show, word: '1word'
    expect(response).must_be :not_found?
  end

  test "returns 404 when word ends with a number" do
    get :show, word: 'word1'
    expect(response).must_be :not_found?
  end

  test "returns 404 when word is blank" do
    get :show, word: ''
    expect(response).must_be :not_found?
  end
end

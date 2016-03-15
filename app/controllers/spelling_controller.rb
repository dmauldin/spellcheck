class SpellingController < ApplicationController
  def show
    @word = Word.new(params[:word])
    if @word.matches.empty?
      render json: { error: 'word not found' }, status: 404
    else
      response = {}
      if @word.correct?
        response[:correct] = true
      else
        response[:correct] = false
        response[:suggestions] = @word.matches
      end
      render json: response
    end
  end
end

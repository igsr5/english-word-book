class TranslatesController < ApplicationController
  def index
    project_id = ENV['CLOUD_PROJECT_ID']

    translate = Google::Cloud::Translate::V2.new project_id: project_id
    @text = 'Hello, world!'
    target = 'ja'
    @translation = translate.translate @text, to: target
    render json: { text: @text, translation: @translation }
  end
end

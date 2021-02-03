class TranslateService
  class << self
    project_id = ENV['CLOUD_PROJECT_ID']
    @@translation = Google::Cloud::Translate::V2.new project_id: project_id

    # translate(翻訳する文, 翻訳したい言語)
    def translate(text, target)
      @@translation.translate text, to: target
    end
  end
end

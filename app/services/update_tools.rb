class UpdateTools
  attr_reader :tool
  class << self
    def perform tool
      @tool = tool
      get_page tool.link
    end

    private
    def get_page link
      uri = URI link
      response = Net::HTTP.get_response uri
      if response.is_a? Net::HTTPSuccess
        @tool.status = true
        get_content response
      end
    end

    def get_content response
      content = response.body
      @tool.content = content[content.index("<article")..content.index("</article>")+9]
      @tool.save
      # case response.to_hash[:server]
      # when "GitHub.com"
      # end
    end
  end
end
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
      tool_content = content[content.index("<article")..content.index("</article>")+9]
        .force_encoding('ASCII-8BIT').encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
      @tool.content = tool_content
      if tool_content.index("<h1>")
        if tool_content.index("<img") && tool_content.index("<img") < tool_content.index("</h1>")
          @tool.image = tool_content[tool_content.index("<img")..tool_content.index("<img")+tool_content[tool_content.index("<img")..tool_content.index("</h1>")].index(">")]
        end
        tool_content = tool_content[tool_content.index("</h1>")..-1]
      end
      @tool.description = tool_content[tool_content.index("<p>")..tool_content.index("</p>")+3]
      @tool.save
      # case response.to_hash[:server]
      # when "GitHub.com"
      # end
    end
  end
end
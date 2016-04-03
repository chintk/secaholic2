class ToolsController < ApplicationController
  def index
    @tools = Tool.visible.page(params[:page]).per Tool::PER_PAGE
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new tool_params
    @tool.save
    redirect_to tools_path
  end

  def show
    @tool = Tool.find params[:id]
  end

  private
  def tool_params
    params.require(:tool).permit Tool::DEFAULT_ATTRIBUTES
  end
end

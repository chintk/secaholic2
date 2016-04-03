namespace :tools do
  desc "auto_crawl_link_everyday"
  task auto_crawl: :environment do
    Tool.visible.each do |tool|
      UpdateTools.perform tool
    end
  end
end

class QwertyAdmin::NodesController < QwertyAdmin::BaseController
  def index
    @root_node = Sitemap.root
  end
end

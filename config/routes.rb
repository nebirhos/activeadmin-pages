ActiveAdmin::Pages::Engine.routes.draw do
  get "/:locale/*url" => "pages#show", constraints: lambda {|req| ActiveAdmin::Pages::Page.find_by_url(req.params[:url], req.params[:locale])}
end

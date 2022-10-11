Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", { :controller => "directors", :action => "index"})
  get("/directors/eldest", { :controller => "directors", :action => "eldest"})
  get("/directors/youngest", { :controller => "directors", :action => "youngest"})
  get("/directors/:id", { :controller => "directors", :action => "director_info"})

  get("/movies", { :controller => "movies", :action => "index"})
  get("/movies/:id", { :controller => "movies", :action => "movie"})

  get("/actors", { :controller => "actors", :action => "index"})
end

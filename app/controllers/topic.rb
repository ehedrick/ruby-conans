RubyConans::App.controllers :topic do

  get :list, map: '/topics', provides: [:js] do
    Topic.all.sort{ |a,b| a.display_order <=> b.display_order}.to_json
  end

end

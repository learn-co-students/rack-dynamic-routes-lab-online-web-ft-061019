class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
  
        if req.path.match(/items/)
           item_requested = req.path.split("/items/").last
  
           if item_found = @@items.find {|item_to_chk| item_to_chk.name == item_requested}
              resp.write item_found.price
              resp.status = 200
           else
              resp.write "Item not found"
              resp.status = 400
           end
  
        else
           resp.write "Route not found"
           resp.status = 404
        end
  
        resp.finish
     end 
end
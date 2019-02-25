class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart  = []
  
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
      elsif req.path.match(/cart/)
      if @@cart.empty?
      req.write "Your cart is empty"
    else 
      @@cart.each do |c|
        req.write "#{c}\n"
    end
  end 

    def req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/add/)
        c_cart = req.params["item"]
    if @@items.include? c_cart
        @@cart  <<  c_cart
        resp.write  "You added #{c_cart}"
      else
        resp.write "We don't have that item"
      end
      resp.write "Path Not Found"
    end

    resp.finish
  end
end
      

  def handle_search(search_term)
    if @@items.include?(search_term)
      return "#{search_term} is one of our items"
    else
      return "Couldn't find #{search_term}"
    end
  end
end

class Application

 @@cart =["Apples","Carrotsmell","Pears"]
  @@items = ["Apples","Carrots","Pears"]	  @@items = ["Apples","Carrots","Pears"]


   def call(env)	  def call(env)
@@ -10,16 +10,35 @@ def call(env)
      @@items.each do |item|	      @@items.each do |item|
        resp.write "#{item}\n"	        resp.write "#{item}\n"
      end	      end
    elsif req.path.match(/cart/)
      if @@cart.empty?
        resp.write"Your cart is empty"
        else
            @@cart.each do |item|
            resp.write "#{item}\n"
        end
      end
    elsif req.path.match(/search/)	    elsif req.path.match(/search/)
      search_term = req.params["q"]	      search_term = req.params["q"]
      resp.write handle_search(search_term)	      resp.write handle_search(search_term)
      elsif req.path.match(/add/)
        added= req.params["item"]
    if @@items.include? added
        @@cart  <<  added
        resp.write  "added #{added}"
      else
        resp.write "We don't have that item"
      end
    else	    else
      resp.write "Path Not Found"	      resp.write "Path Not Found"
    end	    end


     resp.finish	    resp.finish
  end	  end





   def handle_search(search_term)	  def handle_search(search_term)
    if @@items.include?(search_term)	    if @@items.include?(search_term)
      return "#{search_term} is one of our items"	      return "#{search_term} is one of our items"
class Timer                                                                                                                                         
  def initialize(app, content_type= 'application/json')                                                                                                                                      
     @app = app   
     @content_type = content_type                                                                                                                                
    end                                                                                                                                                      

    def call(env)   

      @start_time = Time.now      
      #env['start_time'] = Time.now                                                                                                                            
      @status, @headers, @response = @app.call(env)                                                                                             
      @stop_time = Time.now                                                                                                                                  
      
      begin 
        puts @response 
        json_response = nil
        @response.each do |resp|   
          response_body = JSON.parse resp 
          response_body[:start_time] = @start_time 
          response_body[:stop_time] = @stop_time
          json_response = [@status, @headers, [response_body.to_json]] 
        end
        json_response
      rescue Exception => ex 
        puts ex.message, ex.backtrace
        puts "ssssssssssssssssssss"
        [@status, @headers, @response]
      end                                                                                                                 
    end                                                                                                                                                
 end 
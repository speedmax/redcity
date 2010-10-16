module MessagesHelper
  
  def embedly(content, label)
    idx = 0
    url_start = content.index("http", idx)
    
    while url_start != nil 
      url_end = content[url_start..-1].index(/\s/) || content.length
      # puts "\n str: #{content} \n **url_start = #{url_start} / url_end = #{url_end}\n\n"
      url = content[url_start..url_end]
      content.gsub!(url, "<a href='#{url}'>#{url}</a>")
      idx += url_end
      url_start = content.index("http", idx)
    end
    
    content
  end
  
  
end
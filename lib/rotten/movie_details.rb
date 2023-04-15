require 'nokogiri'
require 'faraday'

module Rotten
  class MovieDetails
    def initialize(link)
      @link = link
    end

    def details
      url = 'https://www.rottentomatoes.com' + @link
      movie = Faraday.get url
      if movie.status == 200
        html = Nokogiri::HTML(movie.body)
        d = html.css('title').text.to_s.strip
        details = d.split('- R')[0].to_s.strip
        darray = details.delete(')').split('(')
        title = darray[0].strip if !darray[0].nil? 
        year = darray[1].strip if !darray[1].nil?
        if year.nil? 
          info_element = html.css('p.scoreboard__info').first
          year = info_element.text[/\d{4}/]
        end
        score = begin
                  html.at_css('score-board')['tomatometerscore']
                rescue
                  nil
                end
        meterclass = begin
                      html.at_css('score-board')['tomatometerstate']
                    rescue
                      nil
                    end
        votes = begin
                  html.css('a[data-qa="tomatometer-review-count"]').text.match(/\d+/).to_s.to_i
                rescue
                  nil
                end
        hash = {}
        html.css('.links-wrap a').each do |a|
          case a['data-qa']
          when 'critic-reviews-all-filter'
            hash['All Critics'] = a.text[/\d+/].to_i rescue nil
          when 'critic-reviews-top-filter'
            hash['Top Critics'] = a.text[/\d+/].to_i rescue nil
          when 'critic-reviews-fresh-filter'
            hash['Fresh'] = a.text[/\d+/].to_i rescue nil
          when 'critic-reviews-rotten-filter'
            hash['Rotten'] = a.text[/\d+/].to_i rescue nil
          end
        end
        info = {}
        info[:name] = title
        info[:year] = year
        info[:meterScore] = score
        info[:meterClass] = meterclass
        info[:votes] = hash
        info[:url] = @link
        info
      end
    end
  end
end
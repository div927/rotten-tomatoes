require "rotten/tomatoes/version"

module Rotten
  module Tomatoes
    class SearchResults
      def initialize(search_query)
        @search_query = search_query
      end

      def perform
        url = "https://www.rottentomatoes.com/search?search=#{URI.encode(@search_query)}"

        doc = Nokogiri::HTML(open(url))
        sleep(2)

        search_results = doc.css('search-page-result')

        movie_results = []
        tv_series_results = []

        search_results.each do |result|
          if result.attr('type') == "movie"
            result.css('search-page-media-row').each do |media_row|
              cast = media_row.attr('cast')&.split(',')
              release_year = media_row.attr('releaseyear')
              tomatometer_score = media_row.attr('tomatometerscore')
              tomatometer_state = media_row.attr('tomatometerstate')
              title = media_row.css('a[data-qa="info-name"]').text.strip
              url = media_row.css('a[data-qa="info-name"]').first['href'].gsub("https://www.rottentomatoes.com","")

              result_info = {
                "name": title,
                "castItems": cast,
                "year": release_year,
                "meterScore": tomatometer_score,
                "meterClass": tomatometer_state,
                "url": url
              }

              movie_results.push(result_info)
            end
          elsif result.attr('type') == "tvSeries"
            result.css('search-page-media-row').each do |media_row|
              cast = media_row.attr('cast')&.split(',')
              start_year = media_row.attr('startyear')
              end_year = media_row.attr('endyear')
              tomatometer_score = media_row.attr('tomatometerscore')
              tomatometer_state = media_row.attr('tomatometerstate')
              title = media_row.css('a[data-qa="info-name"]').text.strip
              url = media_row.css('a[data-qa="info-name"]').first['href'].gsub("https://www.rottentomatoes.com","")

              result_info = {
                "title": title,
                "castItems": cast,
                "startYear": start_year,
                "endYear": end_year,
                "meterScore": tomatometer_score,
                "meterClass": tomatometer_state,
                "url": url
              }

              tv_series_results.push(result_info)
            end
          end
        end

        output = {
          "movies": movie_results,
          "tvSeries": tv_series_results
        }
        return output
      end
    end
  end
end


require 'sinatra'
require 'chartkick'
require 'sinatra/flash'
require 'rest-client'

get '/tags' do
  begin
    server = ENV['MIQ_SERVER']
    url = "https://#{server}/api/categories"

    # Get the tag categories
    res = miq_rest_get(url)

    # Create a hash of categories:tags
    @tags = Hash.new
    res["resources"].each do |resource|
      # Get the category name
      cat_res = miq_rest_get(resource["href"])
      desc = cat_res["description"]

      tag_res = miq_rest_get("#{resource["href"]}/tags?expand=resources&attributes=name")
      @tags[desc] = tag_res["subcount"]
      puts "Collected tag: #{cat_res["description"]}"
    end
    puts "Finished collecting tags"

  end

  erb :tags
end

def miq_rest_get(url)
  begin
    user = ENV['MIQ_USER']
    pass = ENV['MIQ_PASS']

    rest_return = RestClient::Request.execute(
      method: :get,
      url: url,
      :user => user,
      :password => pass,
      :headers => {:accept => :json },
      verify_ssl: false)
    return JSON.parse(rest_return)
  end
end

require 'net/http'
require 'json'
require 'uri'

module ThreadSync
  class Client
    attr_reader :connections, :sync

    def initialize(bearer_token:, base_url: 'https://api.threadsync.io/v1')
      @token = bearer_token
      @base_url = base_url
      @connections = Connections.new(self)
      @sync = Sync.new(self)
    end

    def request(method, path, body: nil)
      uri = URI("#{@base_url}#{path}")
      req = case method
            when :get then Net::HTTP::Get.new(uri)
            when :post then Net::HTTP::Post.new(uri)
            end
      req['Authorization'] = "Bearer #{@token}"
      req['Content-Type'] = 'application/json'
      req['User-Agent'] = "threadsync-ruby/#{VERSION}"
      req.body = body.to_json if body

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      response = http.request(req)

      raise "ThreadSync API error #{response.code}: #{response.body}" unless response.is_a?(Net::HTTPSuccess)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end

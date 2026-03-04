module ThreadSync
  class Connections
    def initialize(client)
      @client = client
    end

    def create(provider:)
      data = @client.request(:post, '/connections', body: { provider: provider })
      Connection.new(data[:id], data[:provider], data[:name], data[:status])
    end

    def get(id)
      data = @client.request(:get, "/connections/#{id}")
      Connection.new(data[:id], data[:provider], data[:name], data[:status])
    end
  end
end

module ThreadSync
  class Sync
    def initialize(client)
      @client = client
    end

    def create(source:, destination:, schedule:)
      body = {
        source: { connection: source[:connection], object: source[:object], table: source[:table] },
        destination: { connection: destination[:connection], object: destination[:object], table: destination[:table] },
        schedule: schedule
      }
      data = @client.request(:post, '/syncs', body: body)
      SyncResult.new(data[:id], data[:status], data[:records_synced])
    end

    def get(id)
      data = @client.request(:get, "/syncs/#{id}")
      SyncResult.new(data[:id], data[:status], data[:records_synced])
    end
  end
end

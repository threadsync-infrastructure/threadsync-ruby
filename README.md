# ThreadSync Ruby SDK

![Gem Version](https://img.shields.io/gem/v/threadsync)
![License](https://img.shields.io/badge/license-MIT-blue)
![Ruby](https://img.shields.io/badge/ruby-%3E%3D%203.0-CC342D)

Official Ruby SDK for the [ThreadSync](https://threadsync.io) API — enterprise data integration platform.

## Installation

```bash
gem install threadsync
```

Or add to your Gemfile:

```ruby
gem 'threadsync'
```

Then run:

```bash
bundle install
```

## Quick Start

```ruby
require 'threadsync'

client = ThreadSync::Client.new(bearer_token: 'your-bearer-token')

# Create a connection
connection = client.connections.create(provider: 'salesforce')
puts "Connection ID: #{connection.id}, Status: #{connection.status}"

# Retrieve a connection
fetched = client.connections.get(connection.id)

# Create a sync
sync = client.sync.create(
  source: {
    connection: 'conn_salesforce_123',
    object: 'Contact',
    table: 'contacts'
  },
  destination: {
    connection: 'conn_postgres_456',
    object: 'record',
    table: 'salesforce_contacts'
  },
  schedule: '0 * * * *'
)
puts "Sync ID: #{sync.id}, Status: #{sync.status}"

# Check sync status
result = client.sync.get(sync.id)
puts "Records synced: #{result.records_synced}"
```

## API Reference

### `ThreadSync::Client`

| Parameter | Type | Description |
|-----------|------|-------------|
| `bearer_token:` | `String` | Your ThreadSync API key |
| `base_url:` | `String` | Override the API base URL (optional) |

### `client.connections`

| Method | Description |
|--------|-------------|
| `create(provider:)` | Create a new connection |
| `get(id)` | Retrieve a connection by ID |

### `client.sync`

| Method | Description |
|--------|-------------|
| `create(source:, destination:, schedule:)` | Create a new sync job |
| `get(id)` | Retrieve a sync job by ID |

## Models

- **`Connection`** — `id`, `provider`, `name`, `status`
- **`SyncResult`** — `id`, `status`, `records_synced`

## Requirements

- Ruby 3.0 or later

## License

MIT — see [LICENSE](LICENSE) for details.

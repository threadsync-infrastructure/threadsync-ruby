module ThreadSync
  Connection = Struct.new(:id, :provider, :name, :status)
  SyncResult = Struct.new(:id, :status, :records_synced)
end

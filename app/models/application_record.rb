class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  connects_to shards: {
    default: { writing: :primary, reading: :primary },
    shard_one: { writing: :primary_shard_one, reading: :primary_shard_one }
  }
end

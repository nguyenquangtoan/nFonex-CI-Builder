class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :participant_id
      t.integer :campaign_id
      t.integer :duration
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end

class CreateApChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :ap_channels do |t|
      t.references :access_point, foreign_key: true
      t.string :bssid

      t.timestamps
    end
  end
end

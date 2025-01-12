# -*- encoding : utf-8 -*-
class CreateSdkActivityReports < ActiveRecord::Migration
  def change
    create_table :sdk_activity_reports do |t|
      t.date :report_date
      t.string :tag
      t.integer :activity_num
      t.integer :request_times
      t.float :request_per_avg

      t.timestamps
    end
    add_index :sdk_activity_reports, :report_date
    add_index :sdk_activity_reports, :tag
  end
end

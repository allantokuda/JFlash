class AddTermLevel < ActiveRecord::Migration
  def change
    add_column :terms, :level, :integer
  end
end

class AddQuiz < ActiveRecord::Migration
  def change
  	create_table :quiz do |t|
			t.integer :term_id, null:false,
			t.integer :level, null:false, default:1
			t.datetime :given

		end
  end
end

class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :english
      t.string :romanji
      t.string :kana
      t.string :kanji

      t.timestamps
    end
  end
end

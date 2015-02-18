class AddAttachmentPictureToPets < ActiveRecord::Migration
  def self.up
    change_table :pets do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :pets, :picture
  end
end

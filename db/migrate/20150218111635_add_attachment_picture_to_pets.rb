class AddAttachmentPictureToPets < ActiveRecord::Migration
  def self.up
    change_table :pets do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :pets, :picture
  end
end

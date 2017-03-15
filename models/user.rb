
class User < ActiveRecord::Base # inherits active_record base for the class blueprint - which is the columns created in the table.
  has_secure_password # bycrypt method for passwords
  # def self.new
  #   puts 'hhaha overwrite it'   if i put this in this will overwrite active record. if it doesnt find it it will inherit methods form active record
  # end
  has_many :comments
end

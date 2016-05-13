class User < ActiveRecord::Base
  authenticates_with_sorcery!   # このモデルでsorceryを使うことの宣言をここで行う

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] } # 新規モデルなら、passwordをcrypted_passwordへセットする
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
end

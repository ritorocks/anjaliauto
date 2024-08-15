# == Schema Information
#
# Table name: employees
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  image_url              :string
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  tasks_count            :integer
#  title                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_employees_on_email                 (email) UNIQUE
#  index_employees_on_reset_password_token  (reset_password_token) UNIQUE
#
class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Direct Associations
  has_many  :tasks, class_name: "Job", foreign_key: "employee_id", dependent: :nullify

  # Indirect Associations
  has_many :trips, through: :tasks, source: :trip

end

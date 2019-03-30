class Uservaluation < ApplicationRecord
  belongs_to :evaluateduser, class_name: "User"
  belongs_to :evaluater, class_name: "User"
end

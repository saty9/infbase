# frozen_string_literal: true

# == Schema Information
#
# Table name: jwt_blacklist
#
#  id  :bigint           not null, primary key
#  jti :string           not null
#  exp :datetime         not null
#

class JWTBlacklist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Blacklist

  self.table_name = 'jwt_blacklist'
end

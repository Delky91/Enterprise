# == Schema Information
#
# Table name: jobs
#
#  id          :bigint           not null, primary key
#  job_title   :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
require "test_helper"

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

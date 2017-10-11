require 'rails_helper'

RSpec.describe Vote, type: :model do

  it { should validate_presence_of (:user_id) }
  it { should validate_presence_of (:post_id) }

end

class Interview < ApplicationRecord
  belongs_to :user
  enum date: {承認: 1, 却下: 2, 保留:3}
end

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validate :check_in_date_cannot_be_in_the_past
  validate :check_out_date_after_check_in_date
  validates :num_of_people, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def check_in_date_cannot_be_in_the_past
    errors.add(:check_in_date, "チェックイン日は本日以降の日付にしてください") if check_in_date.present? && check_in_date < Date.today
  end

  def check_out_date_after_check_in_date
    errors.add(:check_out_date, "チェックアウト日はチェックイン日より後の日付けにしてください") if check_out_date.present? && check_out_date <= check_in_date
  end

  def formatted_confirmation_date
    created_at.strftime("%Y/%m/%d %H:%M")
  end
end

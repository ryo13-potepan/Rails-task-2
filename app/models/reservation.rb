class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in_date, presence: true 
  validates :check_out_date, presence: true
  validates :num_of_people, presence:true, numericality: { greater_than_or_equal_to: 1}

  validate :date_check
  validate :check_in_before_today

  def date_check
    errors.add :check_out_date, "はチェックイン日以降の日付を選択してください。" unless
    check_in_date == nil || check_out_date == nil || check_in_date < check_out_date
  end

  def progressday
    (self.check_out_date - check_in_date).to_i
  end

  def total_price
    self.progressday.to_i * self.num_of_people.to_i * self.room.price
  end

  def check_in_before_today
    errors.add(:check_in_date, "は今日以降の日付を選択してください") if check_in_date != nil && check_out_date != nil && check_in_date < Date.today
  end
end
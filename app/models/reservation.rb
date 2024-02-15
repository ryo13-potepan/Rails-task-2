class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :num_of_people, numericality: { greater_than_or_equal_to: 1}

  validate :date_check

  private

  def date_check
    if self.check_out_date < self.check_in_date
      errors.add :check_out_date, "はチェックイン日以降の日付を選択してください。"
    end
  end
end
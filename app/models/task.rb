class Task < ApplicationRecord
  validates :title, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true


  validate :startdate_when_over_the_enddate

  private

  def startdate_when_over_the_enddate
    if startdate != nil? && enddate != nil && startdate > enddate
      errors.add(:startdate,"または終了日に誤りがあります。")  
    end
  end
end

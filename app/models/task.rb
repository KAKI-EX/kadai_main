class Task < ApplicationRecord
  validates :title, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true


  validate :startdate_when_over_the_enddate

  private

  def startdate_when_over_the_enddate
    if startdate != nil? && enddate != nil && startdate > enddate
      errors.add(:startdate,"が終了日以降に設定されています")  
    end
  end
end

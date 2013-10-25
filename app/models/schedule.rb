class Schedule < ActiveRecord::Base
  belongs_to :section
  belongs_to :subject
  belongs_to :day
  belongs_to :professor
  belongs_to :room

  before_validation :input_finishtime

  validates :section_id, :subject_id, :start_time, :professor_id, :room_id, :day_id, :presence => true
  validates_uniqueness_of :professor_id, :section_id, :room_id, :scope => [:day_id, :start_time]
<<<<<<< HEAD
  before_validation :input_finishtime
=======
>>>>>>> SCHEDULE VALIDATION COMPLETE!

  validate :no_conflict

  validate :no_conflict

  def tcon
    [start_time.to_s(:time), finish_time.to_s(:time)].join(' - ')
  end

  def onedayperiod
    3600 * self.subject.units
  end

  def twodayperiod
    onedayperiod / 2
  end

  def threedayperiod
    onedayperiod / 3
  end

  def input_finishtime
  return if self.start_time.blank?

    if self.day.name.downcase.eql?("mf")
      self.finish_time = self.start_time + twodayperiod
    elsif self.day.name.downcase.eql?("tth")
      self.finish_time = self.start_time + twodayperiod
    elsif self.day.name.downcase.eql?("mwf")
      self.finish_time = self.start_time + threedayperiod
    else
      self.finish_time = self.start_time + onedayperiod
    end
  end


  def no_conflict

    Schedule.all.each do |schedule|

<<<<<<< HEAD
 	def input_finishtime
    return if self.start_time.blank?

    if self.day.name.downcase.eql?("mf")
      self.finish_time = self.start_time + twodayperiod
    elsif self.day.name.downcase.eql?("th")
      self.finish_time = self.start_time + twodayperiod
    elsif self.day.name.downcase.eql?("mwf")
      self.finish_time = self.start_time + threedayperiod
    else
      self.finish_time = self.start_time + onedayperiod
    end
 	end

  def no_conflict
    self.professor.schedules.each do |schedule|

      # For mondays
      if self.day.name.downcase.eql?('m')
        conflict = professor.schedules.includes(:day).
          where("lower(days.name) IN ('m', 'mwf', 'mf' )").
          where('schedules.start_time <= ?', self.start_time).
          where('schedules.finish_time >= ?', self.start_time)

        if conflict.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        end
=======
      if self.day.name.downcase.eql?('m')
        conflict1 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.finish_time)
        conflict2 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time > ? AND schedules.finish_time < ?', self.start_time, self.finish_time)
        conflict3 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.finish_time, self.finish_time)
        conflict4 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.start_time)                          
        if conflict1.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict2.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict3.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict4.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        end
      end

      if self.day.name.downcase.eql?('t')
        conflict1 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('t', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.finish_time)
        conflict2 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('t', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time > ? AND schedules.finish_time < ?', self.start_time, self.finish_time)
        conflict3 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('t', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.finish_time, self.finish_time)
        conflict4 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('t', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.start_time)                          
        if conflict1.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict2.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict3.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict4.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        end
      end

      if self.day.name.downcase.eql?('w')
        conflict1 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('w', 'mwf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.finish_time)
        conflict2 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('w', 'mwf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time > ? AND schedules.finish_time < ?', self.start_time, self.finish_time)
        conflict3 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('w', 'mwf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.finish_time, self.finish_time)
        conflict4 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('w', 'mwf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.start_time)                          
        if conflict1.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict2.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict3.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict4.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        end
      end

      if self.day.name.downcase.eql?('th')
        conflict1 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('th', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.finish_time)
        conflict2 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('th', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time > ? AND schedules.finish_time < ?', self.start_time, self.finish_time)
        conflict3 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('th', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.finish_time, self.finish_time)
        conflict4 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('th', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.start_time)                          
        if conflict1.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict2.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict3.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict4.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        end
      end

      if self.day.name.downcase.eql?('f')
        conflict1 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('f', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.finish_time)
        conflict2 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('f', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time > ? AND schedules.finish_time < ?', self.start_time, self.finish_time)
        conflict3 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('f', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.finish_time, self.finish_time)
        conflict4 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('f', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.start_time)                          
        if conflict1.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict2.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict3.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict4.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        end
      end

      if self.day.name.downcase.eql?('mf')
        conflict1 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'f','mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.finish_time)
        conflict2 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'f','mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time > ? AND schedules.finish_time < ?', self.start_time, self.finish_time)
        conflict3 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'f','mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.finish_time, self.finish_time)
        conflict4 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'f','mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.start_time)                            
        if conflict1.present?
          self.errors.add(:day, 'Sched conflict1')
          return false
        elsif conflict2.present?
          self.errors.add(:day, 'Sched conflict2')
          return false
        elsif conflict3.present?
          self.errors.add(:day, 'Sched conflict3')
          return false
        elsif conflict4.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        end
      end

      if self.day.name.downcase.eql?('tth')
        conflict1 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('t', 'th', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.finish_time)
        conflict2 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('t', 'th', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time > ? AND schedules.finish_time < ?', self.start_time, self.finish_time)
        conflict3 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('t', 'th', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.finish_time, self.finish_time)
        conflict4 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('t', 'th', 'tth' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.start_time)                          
        if conflict1.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict2.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict3.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict4.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        end
      end

      if self.day.name.downcase.eql?('mwf')
        conflict1 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'w', 'f', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.finish_time)
        conflict2 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'w', 'f', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time > ? AND schedules.finish_time < ?', self.start_time, self.finish_time)
        conflict3 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'w', 'f', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.finish_time, self.finish_time)
        conflict4 = Schedule.all.includes(:day).
          where("lower(days.name) IN ('m', 'w', 'f', 'mwf', 'mf' )").
          where('schedules.room_id == ?', self.room_id).
          where('schedules.start_time < ? AND schedules.finish_time > ?', self.start_time, self.start_time)                          
        if conflict1.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict2.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict3.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        elsif conflict4.present?
          self.errors.add(:day, 'Sched conflict')
          return false
        end
      end                                




    end
  end
>>>>>>> SCHEDULE VALIDATION COMPLETE!

      end

    end
  end

end

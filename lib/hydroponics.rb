require 'csv'

class Hydroponics

  def initialize(filepath)
    @filepath = filepath
  end


  def averages(containers)
    ph_sum, nsl_sum, temp_sum, water_level_sum, count = 0, 0, 0, 0, 0.0
    CSV.foreach(@filepath, {:col_sep => " "}) do |row|
      if row[3][-1].to_i == containers
        ph_sum += row[4].to_f
        nsl_sum += row[5].to_i
        temp_sum += row[6].to_i
        water_level_sum += row[7].to_f
        count += 1.0
      end
    end
    {
      container: containers,
      ph: (ph_sum/count).round(2),
      nsl: (nsl_sum/count).round(2),
      temp: (temp_sum/count).round(2),
      water_level: (water_level_sum/count).round(2)
    }
  end

  def highest_averages(containers)
    temp_sum, water_level_sum, count = 0, 0, 0.0
    CSV.foreach(@filepath, {:col_sep => " "}) do |row|
      if row[3][-1].to_i == containers
        temp_sum += row[6].to_i
        water_level_sum += row[7].to_f
        count += 1.0
      end
    end
    {
      container: containers,
      temp: (temp_sum/count).round(2),
      water_level: (water_level_sum/count).round(2)
    }
  end
end



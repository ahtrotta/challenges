class Robot
  NAME_CHARS = ('A'..'Z').to_a
  NAME_DIGS = ('0'..'9').to_a

  @@names = []

  def name
    @robot_name ||= generate_name
  end
  
  def reset
    @robot_name = nil
    name
  end

  private

  def generate_name
    loop do
      new_name = "#{NAME_CHARS.sample}#{NAME_CHARS.sample}" \
        "#{NAME_DIGS.sample}#{NAME_DIGS.sample}#{NAME_DIGS.sample}"
      unless @@names.include?(new_name)
        @@names << new_name
        break new_name
      end
    end
  end
end

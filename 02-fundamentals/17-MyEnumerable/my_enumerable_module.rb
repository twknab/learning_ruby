module My_Enumberable
  def my_each
    # My approach:
    each do |i|
      yield(i)
    end
    # Coding dojo solution technique:
    # for i in 0...self.length
    #     yield(self[i])
    # end
  end
end

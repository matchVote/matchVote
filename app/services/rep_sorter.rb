class RepSorter
  attr_reader :reps, :user

  def initialize(reps, user)
    @reps = reps
    @user = user
  end

  def alphabetically
    reps.reorder(:last_name, :first_name)
  end

  def popularity
    reps.reorder(name_recognition: :desc)
  end

  def age
    reps.reorder(birthday: :desc)
  end

  def seniority
    reps.reorder(:seniority_date, :slug)
  end

  def state
    reps.reorder(:state, :last_name)
  end

  def similarity
    reps
  end

  def difference
    reps
  end

  def method_missing(*args)
    []
  end
end


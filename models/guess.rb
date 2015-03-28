class Guess < Sequel::Model
  one_to_many :questions

  def before_create
    self.created_at ||= DateTime.now
  end
end

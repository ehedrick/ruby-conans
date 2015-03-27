class Question < Sequel::Model
  def matches? guess
    answer = eval text
    (sanitize(answer.inspect) == sanitize(guess)) && (answer == eval(guess))
  end
  
  def sanitize string
    string.tr("'",'"').tr(' ','').gsub(',]',']')
  end
end

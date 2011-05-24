class Paragraph < ActiveRecord::Base
  belongs_to :chapter
  belongs_to :character
  belongs_to :work
  
  searchable do
    text :plain_text
  end
  
  def lines
    plain_text.split('[p]')
  end
  
  def next
    self.class.find(id + 1)
  end
  
  def prev
    self.class.find(id - 1)
  end
  
  
end

class Comment < ActiveRecord::Base
  #строки таблицы являются дочерними к талице psot
  belongs_to :post
  attr_accessible :body, :commenter
end

class Post < ApplicationRecord
     
    include ActiveModel::Validations
    validates_with TitleValidator 

    validates :title, length: {minimum:3 , maximum:50}
    
    has_many :posts_categories
    has_many :categories, through: :posts_categories
    
    accepts_nested_attributes_for :categories

    def categories_attributes=(attributes)
        attributes.each do |key,value|
         exists= Category.find_or_create_by(name: value[:name] )
           exists.posts << self
        end
    end
end
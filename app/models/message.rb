class Message < ActiveRecord::Base
    # 名前は必須入力かつ20文字以内
    validates :name , length: {  maximum: 20 } , presence: true
    # 年齢は数字入力かつ０歳以上
    validates :age, numericality: true ,inclusion: { :in => 0..120 }, presence: true
    validates :age, numericality: { only_integer: true }, presence: true
    # 内容は必須入力かつ2文字以上30文字以下
    validates :body , length: {minimum: 2 , maximum: 30 } , presence: true
end

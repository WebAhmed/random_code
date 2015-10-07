require 'spec_helper'

describe Todo do
  let(:valid_attributes) { {title: "home"} }
  let(:todo) { Todo.new valid_attributes}

  describe "#save" do
    it "returns true" do
      expect {
        todo.save
      }.to change(Todo, :count).by(1)
    end

    it "returns false if title is blank" do
      todo.title = nil
      expect {
        todo.save
      }.to_not change(Todo, :count)
    end
  end
end


class Todo < ActiveRecord::Base
  attr_accessible :title
  validates :title, presence: true
end


class CreateTodos < ActiveRecord::Migration
  def change 
    create_table do |t|
      t.string :title
    end
  end
end



require 'spec_helper'
describe Task do
  let(:task) { Task.new }
  describe "validations" do
    it "title can't be blank" do
      expect(task).to be_invalid
    end
  end
  describe "#complete" do
    it "returns false" do
      expect(task.complete).to be_false
    end
  end
end

#app/spec/factories.rb
FactoryGirl.define do
  factory :todo do
    title { Faker::Lorem.sentence(1) }
  end
  factory :task do
    title { Faker::Lorem.sentence(1) }
    todo
  end
end


# let(:valid_attributes) { {title: "home"} }
# let(:todo) { Todo.new valid_attributes}
# becomes
# let(:todo) { FactoryGirl.create :todo }
# or # let(:todo) { create :todo } if spec_helper.rb is updated with factorygirl syntax methods




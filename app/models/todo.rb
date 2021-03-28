# L4 SOLUTION, BUILD A TodoLit CLI app

class Todo < ActiveRecord::Base #Todo inherited all the functionalites of Active record.
  belongs_to :user
  #considers there is a "users" table and Todo table contains "user_id"

  def due_today?
    due_date == Date.today
  end

  def self.overdue
    all.where("due_date < ? ", Date.today)
  end

  def self.due_today
    all.where("due_date = ? ", Date.today)
  end

  def self.due_later
    all.where("due_date > ? ", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end

  def self.incomplete
    all.where(completed: false)
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue"
    # puts Todo.where("due_date < ?", Date.today).to_displayable_list
    overdue.show_list
    puts "\n"

    puts "Due today"
    # puts Todo.where("due_date = ?", Date.today).to_displayable_list
    due_today.show_list
    puts "\n"

    puts "Due later"
    # puts Todo.where("due_date > ?", Date.today).to_displayable_list
    due_later.show_list
    puts "\n"
  end

  def self.mark_as_complete!(todo_id)
    selected_todo = find(todo_id)
    selected_todo.completed = true
    selected_todo.save
    selected_todo
  end
end

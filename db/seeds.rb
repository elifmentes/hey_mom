UserTask.destroy_all
User.destroy_all
Step.destroy_all
Task.destroy_all
Category.destroy_all

admin = User.create(email: "adminadmin@adminadmin.com",
        password: "password",
        username: "admin",
        gender: false,
        location: "Lisbon"
        )

finance = Category.create(name: "Wallet")
food = Category.create(name: "Food")
health = Category.create(name: "Health")
housekeeping = Category.create(name: "Housekeeping")
productivity = Category.create(name: "Productivity")
relationship = Category.create(name: "Relationship")

# https://www.wikihow.com/api.php?format=json&action=categorylisting
# https://www.wikihow.com/api.php?format=json&action=categorylisting&name=Laundry
# https://www.wikihow.com/api.php?format=json&action=app&subcmd=search&q=hand%20wash%20clothes%20by
# https://www.wikihow.com/api.php?format=json&action=app&subcmd=article&name=Sort Laundry by Colors
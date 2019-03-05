require "open-uri"
require "JSON"

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

wallet = Category.create(name: "Wallet")
food = Category.create(name: "Food")
health = Category.create(name: "Health")
housekeeping = Category.create(name: "Housekeeping")
productivity = Category.create(name: "Productivity")
relationship = Category.create(name: "Relationship")

base_url = "https://www.wikihow.com/api.php?format=json&action=app&subcmd=article&name="
wallet_urls = ["https://www.wikihow.com/api.php?format=json&action=app&subcmd=article&name=Make-Money-as-a-College-Student", "https://www.wikihow.com/api.php?format=json&action=app&subcmd=article&name=Save-Money-As-a-Student"]
food_urls = ["https://www.wikihow.com/api.php?format=json&action=app&subcmd=article&name=Make-Homemade-Food", "https://www.wikihow.com/api.php?format=json&action=app&subcmd=article&name=cook"]

def parse_article(url)
  article = JSON.parse(open(url).read)
end

def build_tasks(category, method, title=nil)
  task = Task.create(category: category, title: title)
  method["steps"].each { |step| build_steps(step, task) }
end

def build_steps(step, task)
  content = step["html"] == "" ? step["summary"] : step["html"]
  step = Step.create(title: step["summary"], content: content, task: task)
  p step
end

def url_multi(category, url)
  article = parse_article(url)
  article = article["app"]["sections"].find { |section| section["type"] == "steps" }
  methods = article["methods"]
  methods.each { |method| build_tasks(category, method, method["name"]) }
end

def url_single(category, url)
  article = parse_article(url)
  title = article["app"]["title"]
  method = article["app"]["sections"].find { |section| section["type"] == "steps" }["methods"][0]
  build_tasks(category, method, title)
end

housekeeping_articles = [
                          "Sort-Laundry",
                          "Reduce-Laundry-Wrinkles",
                          "Clean-Up-Spilled-Laundry-Detergent",
                          "Sort-Laundry-by-Colors",
                          "Do-Your-Laundry-in-a-Dorm",
                          "Wash-Knitted-Blankets",
                          "Iron-Silk",
                          "Iron-Without-an-Ironing-Board",
                          "Remove-Wrinkles-from-Clothes-Without-an-Iron",
                          "Iron-a-Suit-Jacket",
                          "Fold-Clothes",
                          "Fold-a-Dress",
                          "Fold-Clothes-Fast",
                          "Fold-a-Sweater",
                          "Clean-Smoke-Damage",
                          "Clean-Light-Switches",
                          "Clean-Your-House-or-Apartment-Quickly-and-Effectively",
                          "Clean-a-Living-Room",
                          "Keep-Your-House-Clean",
                          "Clean-Your-House-After-a-Wild-Party",
                          "Clean-a-Man-Cave",
                          "Clean-a-Kitchen",
                          "Clean-a-Bathroom-Sink",
                          "Unclog-a-Toilet-with-Dish-Soap",
                          "Clean-Your-Bathroom-Fast",
                          "Clean-Water-Pipes"
                        ]

relationship_articles = [
                          "Know-when-Someone-Likes-You",
                          "Cuddle",
                          "Make-a-Guy-Jealous",
                          "Get-Someone-to-Like-You",
                          "Not-Fall-in-Love-With-Someone",
                          "Care-for-Your-Upset-Boyfriend",
                          "Ask-a-Guy-to-Be-Your-Boyfriend",
                          "Get-in-a-Relationship",
                          "Avoid-People-You-Don%27t-Want-to-Talk-To",
                          "Find-Out-if-a-Person-Actually-Misses-You",
                          "Get-Your-Girlfriend-to-Forgive-You",
                          "Make-Someone-Love-You-Again",
                          "Understand-Platonic-Love-and-Friendship",
                          "Build-a-Healthy-Relationship",
                          "Understand-What-a-Relationship-Means",
                          "Treat-Girls-With-Respect",
                          "React-After-Saying-%22I-Love-You%22",
                          "Plan-a-Special-Night-Out",
                          "Love-Someone-The-Way-He-Is",
                          "Get-Your-Girlfriend-to-Love-You-Again",
                          "Find-Healing-in-Forgiveness",
                          "Love-Again",
                          "End-a-Toxic-Relationship",
                          "Leave-a-Married-Man",
                          "Show-a-Girl-You-Like-Her",
                          "Date-Girls",
                          "Tell-if-a-Boy-Loves-You",
                          "Date",
                          "Be-a-Good-Girlfriend",
                          "Know-if-You-Are-in-the-Friend-Zone",
                          "Tell-Someone-You-Don%27t-Want-to-Date-Them-Without-Hurting-Them",
                          "Give-Your-Girlfriend-an-Unforgettable-Birthday",
                          "Be-Happy-After-Love-Failure",
                          "Learn-Patience-in-a-Relationship",
                          "Get-over-Someone-Who-You-Know-You-Can%27t-Date",
                          "Decide-if-You-Are-Attracted-to-Someone",
                          "Be-a-Protective-Boyfriend",
                          "Break-up-With-Your-Significant-Other-when-You-Are-Already-Dating-Someone-Else",
                          "Stop-Your-Partner-from-Swearing",
                          "Deal-With-a-Jealous-Girlfriend",
                          "Win-a-Man%27s-Heart",
                          "Recognize-Warning-Signs-that-Your-Boyfriend-May-Become-Abusive",
                          "Be-Calm-on-a-First-Date",
                          "Know-if-He%27s-Husband-Material",
                          "Have-a-Grand-Date",
                          "Become-Good-Friends-With-Someone",
                          "Encourage-People",
                          "Accept-Rejection-When-You-Tell-a-Friend-You-Love-Them",
                          "Show-a-Friend-That-You-Care",
                          "Stop-Being-Possessive-About-a-Friend",
                          "Know-if-Your-Friend-Is-Really-a-Friend",
                          "Calm-a-Girl-Down",
                          "Be-Less-Annoying-Towards-Friends",
                          "Stop-Talking-About-Friends-Behind-Their-Backs",
                          "Deal-With-a-Friend-Who-Copies-You",
                          "Deal-With-a-Friend-Who-Constantly-Talks-About-Her-Boyfriend",
                          "Get-Your-Best-Friend-to-Stop-Teasing-You",
                          "Encourage-a-Friend",
                          "Choose-Between-Friends",
                          "Fall-In-Love-with-Your-Best-Friend",
                          "Hang-out-With-Your-Girl-Friends-when-You%27re-the-Only-Guy-Around",
                          "Stay-Close-to-an-Old-Friend-when-at-Different-Schools,-Universities-or-Jobs",
                          "Choose-a-Housemate"
                        ]

productivity_articles = [
                          "Prioritize",
                          "Work-Faster",
                          "Have-a-Productive-Day",
                          "Be-Productive",
                          "Calculate-Productivity",
                          "Avoid-Distractions",
                          "Be-Efficient",
                          "Use-Your-Time-Productively",
                          "Have-a-Productive-Workweek",
                          "Spend-the-Weekend-Doing-Something-Productive",
                          "Check-Your-Efficiency-at-Work-with-Chess-Clocks",
                          "Be-Productive-at-Work",
                          "Work-Hard-Without-Any-Expectations",
                          "Eliminate-All-but-the-Absolute-Essential-Tasks",
                          "Be-Productive-at-Work-During-a-Slow-Week",
                          "Reduce-Everyday-Distractions",
                          "Be-Productive-While-Entertaining-Yourself",
                          "Efficiently-Work-Offline"
                        ]

health_articles = [
                    "Be-Healthy",
                    "Calculate-Your-Body-Age",
                    "Create-a-Wellness-Plan",
                    "Have-a-Good-General-Healthy-Body",
                    "Be-Healthy-and-Happy",
                    "Stay-Fit-and-Beautifully-Healthy",
                    "Lead-a-Healthy-Life",
                    "Maintain-Your-Health",
                    "Live-a-Healthier-Life",
                    "Prevent-Home-Accidents",
                    "Rarely-Get-Sick",
                    "Improve-Your-Health",
                    "Keep-Your-Body-Fit-and-Strong",
                    "Do-a-Health-Assessment",
                    "Stay-Fit-and-Healthy",
                    "Be-Mentally-and-Physically-Healthy",
                    "Stay-Healthy-and-Active",
                    "Take-Control-of-Your-Health",
                    "Stay-Healthy-During-the-Winter",
                    "Look-Healthier",
                    "Be-Healthier-in-14-Days",
                    "Stay-Healthy-With-Busy-Schedules",
                    "Be-Healthier-Without-a-Dramatic-Lifestyle-Change",
                    "Keep-a-Health-Journal",
                    "Stay-Healthy-in-Small-Ways",
                    "Get-a-Little-Healthier-While-Staying-Just-as-Lazy",
                    "Avoid-Unhealthy-Health-Goals",
                    "Get-Better-Health-in-10-Minutes-a-Day",
                    "Be-More-Aware-of-Your-Health",
                    "Stay-Healthy-when-Working-from-Home",
                    "Avoid-Injuring-Yourself",
                    "Avoid-the-Dangers-of-Sitting",
                    "Begin-Living-Healthier",
                    "Get-Healthier-Using-a-Diary",
                    "Include-a-Rest-Day-in-Your-Exercise-Routine",
                    "Be-Healthier-with-Minimal-Effort",
                    "Educate-Others-on-the-Importance-of-Injury-Prevention",
                    "Complete-a-Wellness-Challenge"
                  ]

wallet_urls.each { |url| url_multi(wallet, url) }
food_urls.each { |url| url_multi(food, url) }
health_articles.each { |article| url_single(health, "#{base_url}#{article}") }
housekeeping_articles.each { |article| url_single(housekeeping, "#{base_url}#{article}") }
productivity_articles.each { |article| url_single(productivity, "#{base_url}#{article}") }
relationship_articles.each { |article| url_single(relationship, "#{base_url}#{article}") }

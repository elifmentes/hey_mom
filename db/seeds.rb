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

# HOUSEKEEPING TASKS APIS
# "Sort Laundry": "//www.wikihow.com/Sort-Laundry",
# "Reduce Laundry Wrinkles": "//www.wikihow.com/Reduce-Laundry-Wrinkles",
# "Clean Up Spilled Laundry Detergent": "//www.wikihow.com/Clean-Up-Spilled-Laundry-Detergent",
# "Sort Laundry by Colors": "//www.wikihow.com/Sort-Laundry-by-Colors",
# "Do Your Laundry in a Dorm": "//www.wikihow.com/Do-Your-Laundry-in-a-Dorm",
# "Wash Knitted Blankets": "//www.wikihow.com/Wash-Knitted-Blankets",
# "Iron Silk": "//www.wikihow.com/Iron-Silk",
# "Iron Without an Ironing Board": "//www.wikihow.com/Iron-Without-an-Ironing-Board",
# "Remove Wrinkles from Clothes Without an Iron": "//www.wikihow.com/Remove-Wrinkles-from-Clothes-Without-an-Iron",
# "Iron a Suit Jacket": "//www.wikihow.com/Iron-a-Suit-Jacket",
# "Fold Clothes": "//www.wikihow.com/Fold-Clothes",
# "Fold a Dress": "//www.wikihow.com/Fold-a-Dress",
# "Fold Clothes Fast": "//www.wikihow.com/Fold-Clothes-Fast",
# "Fold a Sweater": "//www.wikihow.com/Fold-a-Sweater",
# "Clean Smoke Damage": "//www.wikihow.com/Clean-Smoke-Damage",
# "Clean Light Switches": "//www.wikihow.com/Clean-Light-Switches",
# "Clean Your House or Apartment Quickly and Effectively": "//www.wikihow.com/Clean-Your-House-or-Apartment-Quickly-and-Effectively",
# "Clean a Living Room": "//www.wikihow.com/Clean-a-Living-Room",
# "Keep Your House Clean": "//www.wikihow.com/Keep-Your-House-Clean",
# "Clean Your House After a Wild Party": "//www.wikihow.com/Clean-Your-House-After-a-Wild-Party",
# "Clean a Man Cave": "//www.wikihow.com/Clean-a-Man-Cave",
# "Clean a Kitchen": "//www.wikihow.com/Clean-a-Kitchen",
# "Clean a Bathroom Sink": "//www.wikihow.com/Clean-a-Bathroom-Sink",
# "Unclog a Toilet with Dish Soap": "//www.wikihow.com/Unclog-a-Toilet-with-Dish-Soap",
# "Clean Your Bathroom Fast": "//www.wikihow.com/Clean-Your-Bathroom-Fast",
# "Clean Water Pipes": "//www.wikihow.com/Clean-Water-Pipes",


# RELATIONSHIP TASKS API
# "Know when Someone Likes You": "//www.wikihow.com/Know-when-Someone-Likes-You",
# "Cuddle": "//www.wikihow.com/Cuddle",
# "Make a Guy Jealous": "//www.wikihow.com/Make-a-Guy-Jealous",
# "Get Someone to Like You": "//www.wikihow.com/Get-Someone-to-Like-You",
# "Not Fall in Love With Someone": "//www.wikihow.com/Not-Fall-in-Love-With-Someone",
# "Care for Your Upset Boyfriend": "//www.wikihow.com/Care-for-Your-Upset-Boyfriend",
# "Ask a Guy to Be Your Boyfriend": "//www.wikihow.com/Ask-a-Guy-to-Be-Your-Boyfriend",
# "Get in a Relationship": "//www.wikihow.com/Get-in-a-Relationship",
# "Avoid People You Don't Want to Talk To": "//www.wikihow.com/Avoid-People-You-Don%27t-Want-to-Talk-To",
# "Find Out if a Person Actually Misses You": "//www.wikihow.com/Find-Out-if-a-Person-Actually-Misses-You",
# "Get Your Girlfriend to Forgive You": "//www.wikihow.com/Get-Your-Girlfriend-to-Forgive-You",
# "Make Someone Love You Again": "//www.wikihow.com/Make-Someone-Love-You-Again",
# "Understand Platonic Love and Friendship": "//www.wikihow.com/Understand-Platonic-Love-and-Friendship",
# "Build a Healthy Relationship": "//www.wikihow.com/Build-a-Healthy-Relationship",
# "Understand What a Relationship Means": "//www.wikihow.com/Understand-What-a-Relationship-Means",
# "Treat Girls With Respect": "//www.wikihow.com/Treat-Girls-With-Respect",
# "React After Saying \"I Love You\"": "//www.wikihow.com/React-After-Saying-%22I-Love-You%22",
# "Plan a Special Night Out": "//www.wikihow.com/Plan-a-Special-Night-Out",
# "Love Someone The Way He Is": "//www.wikihow.com/Love-Someone-The-Way-He-Is",
# "Get Your Girlfriend to Love You Again": "//www.wikihow.com/Get-Your-Girlfriend-to-Love-You-Again",
# "Find Healing in Forgiveness": "//www.wikihow.com/Find-Healing-in-Forgiveness",
# "Love Again": "//www.wikihow.com/Love-Again",
# "End a Toxic Relationship": "//www.wikihow.com/End-a-Toxic-Relationship",
# "Leave a Married Man": "//www.wikihow.com/Leave-a-Married-Man",
# "Show a Girl You Like Her": "//www.wikihow.com/Show-a-Girl-You-Like-Her",
# "Date Girls": "//www.wikihow.com/Date-Girls",
# "Tell if a Boy Loves You": "//www.wikihow.com/Tell-if-a-Boy-Loves-You",
# "Date": "//www.wikihow.com/Date",
# "Be a Good Girlfriend": "//www.wikihow.com/Be-a-Good-Girlfriend",
# "Know if You Are in the Friend Zone": "//www.wikihow.com/Know-if-You-Are-in-the-Friend-Zone",
# "Tell Someone You Don't Want to Date Them Without Hurting Them": "//www.wikihow.com/Tell-Someone-You-Don%27t-Want-to-Date-Them-Without-Hurting-Them",
# "Give Your Girlfriend an Unforgettable Birthday": "//www.wikihow.com/Give-Your-Girlfriend-an-Unforgettable-Birthday",
# "Be Happy After Love Failure": "//www.wikihow.com/Be-Happy-After-Love-Failure",
# "Learn Patience in a Relationship": "//www.wikihow.com/Learn-Patience-in-a-Relationship",
# "Get over Someone Who You Know You Can't Date": "//www.wikihow.com/Get-over-Someone-Who-You-Know-You-Can%27t-Date",
# "Decide if You Are Attracted to Someone": "//www.wikihow.com/Decide-if-You-Are-Attracted-to-Someone",
# "Be a Protective Boyfriend": "//www.wikihow.com/Be-a-Protective-Boyfriend",
# "Break up With Your Significant Other when You Are Already Dating Someone Else": "//www.wikihow.com/Break-up-With-Your-Significant-Other-when-You-Are-Already-Dating-Someone-Else",
# "Stop Your Partner from Swearing": "//www.wikihow.com/Stop-Your-Partner-from-Swearing",
# "Deal With a Jealous Girlfriend": "//www.wikihow.com/Deal-With-a-Jealous-Girlfriend",
# "Win a Man's Heart": "//www.wikihow.com/Win-a-Man%27s-Heart",
# "Recognize Warning Signs that Your Boyfriend May Become Abusive": "//www.wikihow.com/Recognize-Warning-Signs-that-Your-Boyfriend-May-Become-Abusive",
# "Be Calm on a First Date": "//www.wikihow.com/Be-Calm-on-a-First-Date",
# "Know if He's Husband Material": "//www.wikihow.com/Know-if-He%27s-Husband-Material",
# "Have a Grand Date": "//www.wikihow.com/Have-a-Grand-Date",
# "Become Good Friends With Someone": "//www.wikihow.com/Become-Good-Friends-With-Someone",
# "Encourage People": "//www.wikihow.com/Encourage-People",
# "Accept Rejection When You Tell a Friend You Love Them": "//www.wikihow.com/Accept-Rejection-When-You-Tell-a-Friend-You-Love-Them",
# "Show a Friend That You Care": "//www.wikihow.com/Show-a-Friend-That-You-Care",
# "Stop Being Possessive About a Friend": "//www.wikihow.com/Stop-Being-Possessive-About-a-Friend",
# "Know if Your Friend Is Really a Friend": "//www.wikihow.com/Know-if-Your-Friend-Is-Really-a-Friend",
# "Calm a Girl Down": "//www.wikihow.com/Calm-a-Girl-Down",
# "Be Less Annoying Towards Friends": "//www.wikihow.com/Be-Less-Annoying-Towards-Friends",
# "Stop Talking About Friends Behind Their Backs": "//www.wikihow.com/Stop-Talking-About-Friends-Behind-Their-Backs",
# "Deal With a Friend Who Copies You": "//www.wikihow.com/Deal-With-a-Friend-Who-Copies-You",
# "Deal With a Friend Who Constantly Talks About Her Boyfriend": "//www.wikihow.com/Deal-With-a-Friend-Who-Constantly-Talks-About-Her-Boyfriend",
# "Get Your Best Friend to Stop Teasing You": "//www.wikihow.com/Get-Your-Best-Friend-to-Stop-Teasing-You",
# "Encourage a Friend": "//www.wikihow.com/Encourage-a-Friend",
# "Choose Between Friends": "//www.wikihow.com/Choose-Between-Friends",
# "Fall In Love with Your Best Friend": "//www.wikihow.com/Fall-In-Love-with-Your-Best-Friend",
# "Hang out With Your Girl Friends when You're the Only Guy Around": "//www.wikihow.com/Hang-out-With-Your-Girl-Friends-when-You%27re-the-Only-Guy-Around",
# "Stay Close to an Old Friend when at Different Schools, Universities or Jobs": "//www.wikihow.com/Stay-Close-to-an-Old-Friend-when-at-Different-Schools,-Universities-or-Jobs",
# "Choose a Housemate": "//www.wikihow.com/Choose-a-Housemate",


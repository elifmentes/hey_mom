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


#PRODUCTIVITY ARTICLES
# "Prioritize": "//www.wikihow.com/Prioritize",
# "Work Faster": "//www.wikihow.com/Work-Faster",
# "Have a Productive Day": "//www.wikihow.com/Have-a-Productive-Day",
# "Be Productive": "//www.wikihow.com/Be-Productive",
# "Calculate Productivity": "//www.wikihow.com/Calculate-Productivity",
# "Avoid Distractions": "//www.wikihow.com/Avoid-Distractions",
# "Be Efficient": "//www.wikihow.com/Be-Efficient",
# "Use Your Time Productively": "//www.wikihow.com/Use-Your-Time-Productively",
# "Have a Productive Workweek": "//www.wikihow.com/Have-a-Productive-Workweek",
# "Spend the Weekend Doing Something Productive": "//www.wikihow.com/Spend-the-Weekend-Doing-Something-Productive",
# "Check Your Efficiency at Work with Chess Clocks": "//www.wikihow.com/Check-Your-Efficiency-at-Work-with-Chess-Clocks",
# "Be Productive at Work": "//www.wikihow.com/Be-Productive-at-Work",
# "Work Hard Without Any Expectations": "//www.wikihow.com/Work-Hard-Without-Any-Expectations",
# "Eliminate All but the Absolute Essential Tasks": "//www.wikihow.com/Eliminate-All-but-the-Absolute-Essential-Tasks",
# "Be Productive at Work During a Slow Week": "//www.wikihow.com/Be-Productive-at-Work-During-a-Slow-Week",
# "Reduce Everyday Distractions": "//www.wikihow.com/Reduce-Everyday-Distractions",
# "Be Productive While Entertaining Yourself": "//www.wikihow.com/Be-Productive-While-Entertaining-Yourself",
# "Efficiently Work Offline": "//www.wikihow.com/Efficiently-Work-Offline",


#HEALTH
# "Be Healthy": "//www.wikihow.com/Be-Healthy",
# "Calculate Your Body Age": "//www.wikihow.com/Calculate-Your-Body-Age",
# "Create a Wellness Plan": "//www.wikihow.com/Create-a-Wellness-Plan",
# "Have a Good General Healthy Body": "//www.wikihow.com/Have-a-Good-General-Healthy-Body",
# "Be Healthy and Happy": "//www.wikihow.com/Be-Healthy-and-Happy",
# "Stay Fit and Beautifully Healthy": "//www.wikihow.com/Stay-Fit-and-Beautifully-Healthy",
# "Lead a Healthy Life": "//www.wikihow.com/Lead-a-Healthy-Life",
# "Maintain Your Health": "//www.wikihow.com/Maintain-Your-Health",
# "Live a Healthier Life": "//www.wikihow.com/Live-a-Healthier-Life",
# "Prevent Home Accidents": "//www.wikihow.com/Prevent-Home-Accidents"
# "Rarely Get Sick": "//www.wikihow.com/Rarely-Get-Sick",
# "Improve Your Health": "//www.wikihow.com/Improve-Your-Health",
# "Keep Your Body Fit and Strong": "//www.wikihow.com/Keep-Your-Body-Fit-and-Strong",
# "Do a Health Assessment": "//www.wikihow.com/Do-a-Health-Assessment",
# "Stay Fit and Healthy": "//www.wikihow.com/Stay-Fit-and-Healthy",
# "Be Mentally and Physically Healthy": "//www.wikihow.com/Be-Mentally-and-Physically-Healthy",
# "Stay Healthy and Active": "//www.wikihow.com/Stay-Healthy-and-Active",
# "Take Control of Your Health": "//www.wikihow.com/Take-Control-of-Your-Health",
# "Stay Healthy During the Winter": "//www.wikihow.com/Stay-Healthy-During-the-Winter",
# "Look Healthier": "//www.wikihow.com/Look-Healthier",
# "Be Healthier in 14 Days": "//www.wikihow.com/Be-Healthier-in-14-Days",
# "Stay Healthy With Busy Schedules": "//www.wikihow.com/Stay-Healthy-With-Busy-Schedules",
# "Be Healthier Without a Dramatic Lifestyle Change": "//www.wikihow.com/Be-Healthier-Without-a-Dramatic-Lifestyle-Change",
# "Keep a Health Journal": "//www.wikihow.com/Keep-a-Health-Journal",
# "Stay Healthy in Small Ways": "//www.wikihow.com/Stay-Healthy-in-Small-Ways",
# "Get a Little Healthier While Staying Just as Lazy": "//www.wikihow.com/Get-a-Little-Healthier-While-Staying-Just-as-Lazy",
# "Avoid Unhealthy Health Goals": "//www.wikihow.com/Avoid-Unhealthy-Health-Goals",
# "Get Better Health in 10 Minutes a Day": "//www.wikihow.com/Get-Better-Health-in-10-Minutes-a-Day",
# "Be More Aware of Your Health": "//www.wikihow.com/Be-More-Aware-of-Your-Health",
# "Stay Healthy when Working from Home": "//www.wikihow.com/Stay-Healthy-when-Working-from-Home",
# "Avoid Injuring Yourself": "//www.wikihow.com/Avoid-Injuring-Yourself",
# "Avoid the Dangers of Sitting": "//www.wikihow.com/Avoid-the-Dangers-of-Sitting",
# "Begin Living Healthier": "//www.wikihow.com/Begin-Living-Healthier",
# "Get Healthier Using a Diary": "//www.wikihow.com/Get-Healthier-Using-a-Diary",
# "Include a Rest Day in Your Exercise Routine": "//www.wikihow.com/Include-a-Rest-Day-in-Your-Exercise-Routine",
# "Be Healthier with Minimal Effort": "//www.wikihow.com/Be-Healthier-with-Minimal-Effort",
# "Educate Others on the Importance of Injury Prevention": "//www.wikihow.com/Educate-Others-on-the-Importance-of-Injury-Prevention",
# "Complete a Wellness Challenge": "//www.wikihow.com/Complete-a-Wellness-Challenge",


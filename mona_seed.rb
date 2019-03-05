require "JSON"
require "open-uri"

wallet_urls = ["https://www.wikihow.com/api.php?format=json&action=app&subcmd=article&name=Make-Money-as-a-College-Student", "https://www.wikihow.com/api.php?format=json&action=app&subcmd=article&name=Save-Money-As-a-Student"]
food_urls = ["https://www.wikihow.com/api.php?format=json&action=app&subcmd=article&name=Make-Homemade-Food", "https://www.wikihow.com/api.php?format=json&action=app&subcmd=article&name=cook"]

def parse_article(url)
  article = JSON.parse(open(url).read)
  article["app"]["sections"].find { |section| section["type"] == "steps" }
end

def build_tasks(category, method)
  title = method["name"]
  task = Task.create(category: category, title: title)
  method.steps.each do { |step| build_steps(step, task) }
end

def build_steps(step, task)
  Step.create(title: , content: , task: )
end

wallet_urls.each do |url|
  article = parse_article(url)
  methods = article["methods"]
  methods.each { |method| build_tasks("wallet", method) }

end


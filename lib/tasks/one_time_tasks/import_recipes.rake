namespace :recipes do
  desc 'Import recipes from file'
  task import: :environment do
    Recipe.create!(JSON.parse(File.read('./recipes-en.json')))
  end
end

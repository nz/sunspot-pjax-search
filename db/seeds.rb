# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_options = {
  headers: true,
  header_converters: :symbol,
  quote_char: '~'
}

WORKS = {}
if Work.count == 0
  puts "Importing works..."
  works = Rails.root.join('vendor/oss-textdb/Works.txt')
  CSV.read(works, csv_options).each do |row|
    puts "\t#{row[:title]}..."
    WORKS[row[:workid].to_sym] = Work.create!(
      work_id:      row[:workid],
      title:        row[:title],
      long_title:   row[:longtitle],
      date:         row[:date]
    )
  end
end

if Character.count == 0
  puts "Importing characters..."
  works = Rails.root.join('vendor/oss-textdb/Characters.txt')
  CSV.read(works, csv_options).each do |row|
    puts "\t#{row[:charname]}..."
    Character.create!(
      char_id:      row[:charid],
      name:         row[:charname],
      abbrev:       row[:abbrev],
      description:  row[:description],
      speech_count: row[:speechcount],
      work:         WORKS[row[:works].to_sym]
    )
  end
end

if Chapter.count == 0
  puts "Importing chapters..."
  works = Rails.root.join('vendor/oss-textdb/Chapters.txt')
  CSV.read(works, csv_options).each do |row|
    puts "\t#{row[:workid]} #{row[:Section]}.#{row[:Chapter]}..."
    Chapter.create!(
      description:  row[:description],
      section:      row[:section],
      chapter:      row[:chapter],
      chapter_id:   row[:chapterid],
      work:         WORKS[row[:workid].to_sym]
    )
  end
end


if Paragraph.count == 0
  puts "Importing paragraphs..."
  works = Rails.root.join('vendor/oss-textdb/Paragraphs.txt')
  CSV.read(works, csv_options).each do |row|
    puts "\t#{row[:workid]} #{row[:paragraphid]}..."
    Paragraph.create!(
      plain_text:     row[:plaintext],
      chapter:        Chapter.where(work_id: row[:workid], section: row[:section], chapter: row[:chapter]).first,
      character:      Character.where(char_id: row[:charid]).first,
      work:           WORKS[row[:workid].to_sym]
    )
  end
end



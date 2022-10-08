# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

sentence1, sentence2 = Sentence.create([
  { text: 'Apple is looking at buying U.K. startup for $1 billion.' },
  { text: 'Regional funds with exposure to United States and outperform equity market over 3 years' },
])

org, gpe, money, theme, time = EntityType.create([
  { text: 'ORG', color: '#7feceb' },
  { text: 'GPE', color: '#fbc97a' },
  { text: 'MONEY', color: '#e4e7d3' },
  { text: 'THEME', color: '#f67aff' },
  { text: 'TIME', color: '#7a7eff' }
])

apple, uk, one_billion, reg_founds, us, equity_market, three_years = Entity.create([
  { word_start_index: 0, word_end_index: 0, entity_type_id: org.id, sentence_id: sentence1.id },
  { word_start_index: 5, word_end_index: 5, entity_type_id: gpe.id, sentence_id: sentence1.id},
  { word_start_index: 8, word_end_index: 9, entity_type_id: money.id, sentence_id: sentence1.id},
  { word_start_index: 0, word_end_index: 1, entity_type_id: theme.id, sentence_id: sentence2.id},
  { word_start_index: 5, word_end_index: 6, entity_type_id: gpe.id, sentence_id: sentence2.id},
  { word_start_index: 9, word_end_index: 10, entity_type_id: theme.id, sentence_id: sentence2.id},
  { word_start_index: 12, word_end_index: 13, entity_type_id: time.id, sentence_id: sentence2.id}
])
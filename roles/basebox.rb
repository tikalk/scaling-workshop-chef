name 'basebox'

run_list [
  'recipe[tikal-redis]',
  'recipe[tikal-memcache]',
  'recipe[tikal-solr]'
]

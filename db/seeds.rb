# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
trees = [
    'American Basswood', 'Boxelder', 'Bur Oak', 'Black Cherry',
    'Eastern Cottonwood', 'Honey Locust', 'Northern Red Oak',
    'Northern White Cedar', 'Paper Birch', 'Pin Oak', 'Red Maple',
    'Shagbark Hickory', 'Silver Maple', 'Sugar Maple', 'Trembling Aspen',
    'Yellow Poplar', 'White Ash', 'Yellow Birch'
]
authorsLong = [
    'William Shakespeare', 'Robert Frost', 'Emily Dickinson', 'Maya Angelou',
    'Edgar Allan Poe', 'Langston Hughes', 'Walt Whitman', 'George Gordon Byron',
    'Shel Silverstein', 'Elizabeth Barrett Browning', 'Pablo Neruda',
    'W. B. Yeats', 'E. E. Cummings', 'William Wordsworth', 'William Blake',
    'Henry Wadsworth Longfellow', 'Sylvia Plath', 'T. S. Eliot', 'Dylan Thomas',
    'Robert Browning', 'John Keats', 'Thomas Hardy', 'Emily Bronte',
    'Allen Ginsberg', 'Oscar Wilde', 'Percy Bysshe Shelley', 'John Donne',
    'Robert Burns', 'Amy Lowell', 'Rudyard Kipling', 'Charlotte Bronte',
    'Samuel Taylor Coleridge', 'Ted Hughes', 'Ralph Waldo Emerson',
    'Matthew Arnold', 'Charles Bukowski', 'W. H. Auden', 'Geoffrey Chaucer',
    'Carl Sandburg', 'Dante Alighieri', 'Anna Akhmatova'
]
zodiac = [
    'Aquarius', 'Pisces', 'Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo',
    'Virgo', 'Libra', 'Scorpio', 'Sagittarius', 'Capricorn'
]
colorsLong = [
   'ivory', 'beige', 'brown', 'wheat', 'tan', 'khaki', 'silver', 'gray',
   'charcoal', 'blue', 'navy blue', 'royal blue', 'azure', 'cyan', 'aquamarine',
   'teal', 'forest green', 'olive', 'chartreuse', 'gold', 'yellow', 'lime',
   'coral', 'goldenrod', 'salmon', 'hot pink', 'puce', 'fuchsia', 'mauve',
   'lavender', 'plum', 'red', 'maroon', 'indigo', 'crimson'
]
punctuation = ["!", '.', ',', '?', ';']
stores = [
    'Target', 'Fry\'s', 'Meijer', 'Walmart', 'Home Depot', 'Cabella\'s',
    'Best Buy', 'Sears', 'Lowe\'s', 'Gander Mountain', 'Zales', 'AutoZone',
    'Menards', 'Radio Shack', 'CVS', 'Kroger', 'Costco', 'LensCrafters', 'Kmart',
    'Staples', 'Office Depot', 'Dollar General', 'Bed Bath & Beyond',
    'Big Lots', 'HomeGoods', 'Foot Locker', 'Cost Plus', 'Shoe Carnival',
    'Brookstone', 'Hancock Fabrics'
]
def randomElement(arr)
    arr[Random.rand(arr.length)]
end
def randomString(arr_of_arrs)
    string = ""
    Random.rand(20).times do 
        string << randomElement(randomElement(arr_of_arrs))
        string << " "
    end
    string << randomElement(["!", '.', ',', '?', ';'])
    string
end
def paragraph(arr_of_arrs)
    paragraph = ""

    Random.rand(18).times do 
        paragraph << randomString(arr_of_arrs)
    end
    paragraph
end


Category.destroy_all
Post.destroy_all
User.destroy_all
PostCategory.destroy_all
Comment.destroy_all

5.times do 
    Category.create(:name => "#{randomElement(colorsLong)} #{randomElement(trees)}" )
end
5.times do 
    Post.create(:title => "#{randomElement(colorsLong)} #{randomElement(zodiac)}", :content => paragraph([trees, authorsLong, colorsLong, zodiac, stores]));
end
5.times do 
    PostCategory.create(:post_id => randomElement(Post.all).id, :category_id => randomElement(Category.all).id)
end
5.times do 
    User.create(:username => randomElement(authorsLong), :email => randomElement(stores))
end
5.times do 
    Comment.create(:content => randomString([trees, authorsLong, colorsLong, zodiac, stores]), :user_id => randomElement(User.all).id, :post_id => randomElement(Post.all).id)
end

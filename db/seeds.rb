User.create(uid: SecureRandom.alphanumeric(10), nickname:SecureRandom.alphanumeric(10), name: "person1", image:"https://1.bp.blogspot.com/-zjC0cxWMMN8/XZR9wJ4DnMI/AAAAAAABVVA/ASTQQk9XoL4TPdMYrrMzPgWdlWynIES7wCNcBGAsYHQ/s1600/pan_kame.png")
User.create(uid: SecureRandom.alphanumeric(10), nickname:SecureRandom.alphanumeric(10), name: "person2", image:"https://1.bp.blogspot.com/-ocRr0y766IA/XwkxkrnOvXI/AAAAAAABaCo/ux6-J7WXx58L5Ou7da9cT7pps1X2poxPwCNcBGAsYHQ/s1600/pan_pizza_toast.png" )
User.create(uid: SecureRandom.alphanumeric(10), nickname:SecureRandom.alphanumeric(10), name: "person3", image:"https://3.bp.blogspot.com/-1M7bLFXub_I/W64D2jr3urI/AAAAAAABPKM/vjrEc_WPAKk6QJyqzVqk3cPUL6BFXTcQQCLcBGAs/s800/pan_harinezumi.png" )
User.create(uid: SecureRandom.alphanumeric(10), nickname:SecureRandom.alphanumeric(10), name: "person4", image:"https://3.bp.blogspot.com/-3SxRN4PcpiU/Vz_w6jtCR0I/AAAAAAAA6us/x0mIYGF392c9cj5YaNbZxtvRgdWmV5UngCLcB/s800/food_fruit_sandwich.png" )
User.create(uid: SecureRandom.alphanumeric(10), nickname:SecureRandom.alphanumeric(10), name: "person5", image:"https://1.bp.blogspot.com/-s5sqbuyTLkA/UWgWbDG7WiI/AAAAAAAAQC0/GRdjpGfs6YU/s1600/food_melonpan.png" )

(1..30).each do |i|
    user = User.find(i%5+2)
    user.tweets.create(content:"test tweet#{i}")
end


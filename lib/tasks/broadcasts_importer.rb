module UsersImporter

  # import users
  def import_users
    puts "Importing broadcasts..."
    use_old_database
    broadcasts = ActiveRecord::Base.connection.execute('
      SELECT id, broadcast_date, session_name, real_audio, part1title, part2title, part3title, part4title, ra1, ra2, ra3 FROM solidsteel_broadcasts
      ')

    
    use_new_database
    for i in 0...broadcasts.count do
      row = broadcasts.get_row i
      
      b = Broadcast.new(id: row.get("id"),
                        broadcast_date: row.get("broadcast_date"),
                        session_name: row.get("session_name"),
                        real_audio: row.get("real_audio"),
                        part1title: row.get("part1title"),
                        part2title: row.get("part2title"),
                        part3title: row.get("part3title"),
                        part4title: row.get("part4title"),
                        ra1: row.get("ra1"),
                        ra2: row.get("ra2"),
                        ra3: row.get("ra3")
                      )
      # unless user
      #   user = User.new(first_name: row.get("firstname"), 
      #                   last_name: row.get("lastname"),
      #                   email: row.get("mail"),
      #                   isfemale: row.get("isfemale"))
      begin
        b.save!
      rescue Exception => e
        puts "Failed to save #{row.get('session_name')}: #{e.message}"
      end
    end
  end
end
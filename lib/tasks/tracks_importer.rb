module ProjectsImporter

  # import projects
  def import_projects
    puts "Importing tracks..."
    use_old_database
    tracks = ActiveRecord::Base.connection.execute('
      SELECT id, broadcast_id, part, artist, title, composed, published, record_label, catalogue_no, duration, notes FROM solidsteel_tracks
      ')

    use_new_database
    for i in 0...tracks.count do
      row = tracks.get_row i
      
      t = Track.new(id: row.get("id"),
                      broadcast_id: row.get("broadcast_id"),
                      part: row.get("part"),
                      artist: row.get("artist"),
                      title: row.get("title"),
                      composed: row.get("composed"),
                      published: row.get("published"),
                      record_label: row.get("record_label"),
                      catalogue_no: row.get("catalogue_no"),
                      duration: row.get("duration"),
                      notes: row.get("notes")

        )
      
      begin
        t.save!
      rescue Exception => e
        puts "Failed to save #{row.get("title")}: #{e.message}"
      end
    end
  end
end
# Controller for Music artist subject, inherited from subjects controller
class MusicArtistsController < SubjectsController
  @subject_class = MusicArtist
  @subject_path = :music_artists_path
end


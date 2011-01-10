# Controller for Movie subject, inherited from subjects controller
class MoviesController < SubjectsController
  @subject_class = Movie
  @subject_path = :movies_path
end


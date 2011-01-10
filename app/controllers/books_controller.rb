# Controller for Book subject, inherited from subjects controller
class BooksController < SubjectsController
  @subject_class = Book
  @subject_path = :books_path
end

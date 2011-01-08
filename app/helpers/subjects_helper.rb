module SubjectsHelper
  
  def categories(subject)
    html = ""
    html << "<span class='option' title='Director - #{subject.director}'>#{subject.director}</span>" if subject.director.present?
    html << "<span class='option' title='Year - #{subject.year}'>#{subject.year}</span>" if subject.year.present?
    html << "<span class='option' title='Origin - #{subject.origin}'>#{subject.origin}</span>" if subject.origin.present?
    html << "<span class='option' title='Author - #{subject.author}'>#{subject.author}</span>" if subject.author.present?
    html << "<span class='option' title='Music type - #{subject.music_type}'>#{subject.music_type}</span>" if subject.music_type.present?
    html << "<span class='option' title='Genre - #{subject.genre}'>#{subject.genre}</span>" if subject.genre.present?
    html
  end
end

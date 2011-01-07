module SubjectsHelper
  
  def categories(subject)
    html = ""
    html << "<span class='option' title='Director - #{subject.director}'>#{subject.director}</span>" if subject.director?
    html << "<span class='option' title='Year - #{subject.year}'>#{subject.year}</span>" if subject.year?
    html << "<span class='option' title='Origin - #{subject.origin}'>#{subject.origin}</span>" if subject.origin?
    html << "<span class='option' title='Author - #{subject.author}'>#{subject.author}</span>" if subject.author?
    html << "<span class='option' title='Music type - #{subject.music_type}'>#{subject.music_type}</span>" if subject.music_type?
    html << "<span class='option' title='Genre - #{subject.genre}'>#{subject.genre}</span>"
  end
end

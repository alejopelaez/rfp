module SimilaritySearch
  module Math
    
    def self.distance(pointa, pointb)
      ::Math.sqrt((pointa - pointb)**2)
    end
    
  end

  def self.similars(to, tol=5)
    base_score = to.score
    nears = []
    Project.all.each do |p|
      if p.score and to.id != p.id and Math.distance(base_score, p.score) < tol
        nears << p
      end
    end
    nears
  end
  def self.category_score(category, to)
    category_scores = category.by_project(to.id)
    sum = 0
    i = 0
    puts category_scores.inspect
    category_scores.each do |c|
      puts i
      puts c.inspect
      puts c.total_score
      sum += c.total_score.to_f
      i += 1
    end
    sum = sum/i.to_f
    (sum*100).round/100.0
  end
  def self.similars_by(category, to, tol=10)
    base_score = category_score(category, to)
    nears = []
    Project.all.each do |p|
      if p.score and to.id != p.id and
          Math.distance(base_score, category_score(category, p)) < tol
        nears << p
      end
    end
    nears
  end
end

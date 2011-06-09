module SimilaritySearch
  module Math
    
    def self.distance(pointa, pointb)
      ::Math.sqrt((pointa - pointb)**2)
    end
    
  end

  def self.similars(to, tol=10)
    base_score = to.score
    nears = []
    Project.all.each do |p|
      if p.score and to.id != p.id and Math.distance(base_score, p.score) < tol
        nears << p
      end
    end
    nears
  end
end

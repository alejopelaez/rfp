class Project < ActiveRecord::Base
  has_many :assignments

  has_attached_file :rfp
  attr_accessible :name, :status, :score, :rfp, :company, :comment

  STATUS = ["pendiente", "aprovado", "rechazado", "en proceso"]

  def self.status_list
    STATUS
  end

  def grades_pending?
    Assignment.pending.by_project(id).count > 0
  end

  def pending_users
    user_ids = []
    Assignment.pending.by_project(id).each do |a|
      user_ids << a.user_id
    end
    user_ids.uniq!
    users = []
    user_ids.each do |id|
      users << User.find(id)
    end
    users
  end

  def similars
    SimilaritySearch.similars(self)
  end

  def cost_similars
    SimilaritySearch.similars_by(CostScore, self)
  end

  def tech_similars
    SimilaritySearch.similars_by(TechnologyScore, self)
  end

  def dev_similars
    SimilaritySearch.similars_by(DevelopmentScore, self)
  end

  def legal_similars
    SimilaritySearch.similars_by(LegalScore, self)
  end

  def risk_similars
    SimilaritySearch.similars_by(RiskScore, self)
  end

  def opp_similars
    SimilaritySearch.similars_by(OpportunityScore, self)
  end

  def calculate_score
    cost_scores = CostScore.by_project(self.id)
    tech_scores = TechnologyScore.by_project(self.id)
    dev_scores = DevelopmentScore.by_project(self.id)
    legal_scores = LegalScore.by_project(self.id)
    risk_scores = RiskScore.by_project(self.id)
    opp_scores = OpportunityScore.by_project(self.id)

    sum = 0
    i = 0
    cost_scores.each do |c|
      sum += c.total_score.to_f
      i += 1
    end
    tech_scores.each do |c|
      sum += c.total_score.to_f
      i += 1
    end
    dev_scores.each do |c|
      sum += c.total_score.to_f
      i += 1
    end
    legal_scores.each do |c|
      sum += c.total_score.to_f
      i += 1
    end
    risk_scores.each do |c|
      sum += c.total_score.to_f
      i += 1
    end
    opp_scores.each do |c|
      sum += c.total_score.to_f
      i += 1
    end
    sum = sum/i.to_f
    self.score = (sum*100).round/100.0
    self.save
  end
end

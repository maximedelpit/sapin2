# frozen_string_literal: true

# == Schema Information
#
# Table name: report_obligation_dispositions
#
#  id                   :integer          not null, primary key
#  report_obligation_id :integer
#  disposition_id       :integer
#  status    :integer          default(0), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_report_obligation_dispositions_on_disposition_id        (disposition_id)
#  index_report_obligation_dispositions_on_report_obligation_id  (report_obligation_id)
#
# Foreign Keys
#
#  fk_rails_...  (disposition_id => dispositions.id)
#  fk_rails_...  (report_obligation_id => report_obligations.id)
#

# Model the status of all dispositions the company has to take for a given obligations
class ReportObligationDisposition < ApplicationRecord
  enum status: %i[to_do doing done]

  belongs_to :report_obligation
  belongs_to :disposition

  validates :status, presence: true, inclusion: { in: ReportObligationDisposition.statuses.keys }
end

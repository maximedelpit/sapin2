# frozen_string_literal: true

# == Schema Information
#
# Table name: report_obligations
#
#  id            :integer          not null, primary key
#  report_id     :integer
#  obligation_id :integer
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_report_obligations_on_obligation_id  (obligation_id)
#  index_report_obligations_on_report_id      (report_id)
#
# Foreign Keys
#
#  fk_rails_...  (obligation_id => obligations.id)
#  fk_rails_...  (report_id => reports.id)
#

# Link a report and its obligations and show their status depending on the result of the report
class ReportObligation < ApplicationRecord
end

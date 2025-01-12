# -*- encoding : utf-8 -*-
class Seed::PropDetailReportsController < ApplicationController
  # GET /seed/prop_detail_reports
  # GET /seed/prop_detail_reports.json
  include ApplicationHelper
  def index
    params.permit!
    @seed_prop_detail_report = Seed::PropDetailReport.new(params[:seed_prop_detail_report])
    @seed_prop_detail_report.from_date ||= Date.today.to_s
    @seed_prop_detail_report.end_date ||= Date.today.to_s
    @seed_prop_detail_report.tag ||= System::TagGroup::TOTAL_SUM_TAG
    tags = tags_options_cache(@seed_prop_detail_report.class)
    @seed_prop_detail_report_form_json = {name: 'seed_prop_detail_report_form',action: '/seed/prop_detail_reports/index',
                                        form_items:[{name: 'from_date',attributes: {input_type: 'datetime',default: @seed_prop_detail_report.from_date }},
                                                     {name: 'end_date',attributes: {input_type: 'datetime',default: @seed_prop_detail_report.end_date }},
                                                     {name: 'tag',attributes: {input_type: 'select',default: @seed_prop_detail_report.tag,data: tags }}]
                                        }
    respond_to do |format|
      format.html # index.html.erb
      format.json do 
        json_data = { form: @seed_prop_detail_report_form_json }
        json_data[:body] = @seed_prop_detail_report.search if params[:seed_prop_detail_report]
        render :json => json_data
      end
    end
  end

end

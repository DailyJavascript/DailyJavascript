class VisitsController < ApplicationController
	require 'set'

	def create
		rc = nil
		bv = false
		puts params.permit("refcode")
		puts params.permit("refcode").inspect
		puts params.permit("refcode")["refcode"]
		puts params.permit("refcode")["refcode"].inspect
		if (!params.permit("refcode")["refcode"].nil?)
			rc = params.permit("refcode")["refcode"]
		end
		if (!params.permit("blogVisit")["blogVisit"].nil?)
			if (params.permit("blogVisit")["blogVisit"] == "1")
				bv = true
			end
		end
		v = Visit.create(user_id: 0, ref_code: rc, date_first_visited: DateTime.now, signed_up: false, from_blog: bv)
		v.create_visitor_activity(section_ids: "", did_click_input: false, email_input_value: "", did_click_payment: false, did_click_test_page: false, did_click_upgrade_link: false, plan: "")
		puts v
		puts v.inspect
		puts v.id
		puts v.id.inspect
		render plain: v.id
	end

	def update
		field = ""
		value = nil
		if (params["field"] == "didScroll") 
			field = "did_scroll"
		elsif (params["field"] == "sectionID") 
			field = "section_ids"
		elsif (params["field"] == "didClickPayment") 
			field = "did_click_payment"
		elsif (params["field"] == "didInputEmail") 
			field = "did_click_input"
		elsif (params["field"] == "emailInputValue") 
			field = "email_input_value"
		elsif (params["field"] == "didClickTestPage") 
			field = "did_click_test_page"
		elsif (params["field"] == "didClickUpgradeLink") 
			field = "did_click_upgrade_link"
		elsif (params["field"] == "plan") 
			field = "plan"
		end
		
		va = VisitorActivity.find_by(visit_id: params["visitID"])
		
		if (params["value"] == "true")
			value = true
		elsif (field == "section_ids")
			arr = va.section_ids.split(",")
			value = arr.to_set.add(params.permit("value")["value"]).to_a.sort.join(",")
		elsif (field == "email_input_value")
			if (va.email_input_value == "")
				value = params.permit("value")["value"]
			else
				value = va.email_input_value + "," + params.permit("value")["value"]
			end
		elsif (field == "plan")
			if (va.plan == "")
				value = params.permit("value")["value"]
			else
				value = va.plan + "," + params.permit("value")["value"]
			end
		else
			value = params.permit("value")["value"]
		end
				
		va[field] = value
		va.save
	
		render plain: "ok"
	end

end
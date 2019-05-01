module InitCareer
  module ApplicationHelper

	def timezone
	    return 'America/Phoenix'
	end
	
	def set_Date_With_Time(dt)
		return dt.in_time_zone(timezone).strftime("%B %d, %Y %I:%M %p")
	end

	def set_Date(dt)
		return dt.in_time_zone(timezone).strftime("%m/%d/%Y")
	end

	def get_form_element(answer_type, options, k)
		# return options.to_a
		case answer_type
		when 'text'
			formHtml = '<input class="form-control" type="text" name="career_submission[question_answers]['<<k.to_s<<'][answer]">'
		when 'textarea'
			formHtml = '<textarea class="form-control" name="career_submission[question_answers]['<<k.to_s<<'][answer]"></textarea>'
		when 'select'
			formHtml = '<select class="form-control" name="career_submission[question_answers]['<<k.to_s<<'][answer]">'

			options.to_a.each do |opt|
				formHtml += '<option value="'<<opt.to_s<<'">'<<opt.to_s<<'</option>'
			end

			formHtml += '</select>'
		when 'radio'
			formHtml = ''
			options.to_a.each_with_index do |opt, indx|
				formHtml += '<label class="radio-inline"><input type="radio" name="career_submission[question_answers]['<<k.to_s<<'][answer]" id="inlineRadio'<<indx.to_s<<'" value="'<<opt.to_s<<'"> '<<opt.to_s<<'</label>'
			end
		when 'checkbox'
			formHtml = ''
			options.to_a.each_with_index do |opt, indx|
				formHtml += '<label class="checkbox-inline"><input type="checkbox" name="career_submission[question_answers]['<<k.to_s<<'][answer][]" id="inlineRadio'<<indx.to_s<<'" value="'<<opt.to_s<<'"> '<<opt.to_s<<'</label>'
			end
		end
		return formHtml
	end

		# check if url contains http
  	# it not then concatinate http to url
  	def smart_add_url_protocol(url)
    	unless url[/\Ahttp:\/\//] || url[/\Ahttps:\/\//]
      		return "http://#{url}"
    	else
      		return "#{url}"
    	end
  	end

	
  end
end

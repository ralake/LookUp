def format_measurments(params)
  params.each { |key, value| params[key] = value[0..-2].to_f if value.include?('m') }
end
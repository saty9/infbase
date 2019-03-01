ActionController::Renderers.add :csv do |collection, options|
  self.content_type ||= Mime::CSV
  self.headers['Content-Disposition'] = "attachment; filename=#{options[:filename]}.csv" if options[:filename]
  self.response_body = collection.to_csv(options[:from_day], options[:to_day])
end
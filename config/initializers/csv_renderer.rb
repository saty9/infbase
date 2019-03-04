# frozen_string_literal: true

ActionController::Renderers.add :csv do |collection, options|
  self.content_type ||= Mime::CSV
  headers['Content-Disposition'] = "attachment; filename=#{options[:filename]}.csv" if options[:filename]
  self.response_body = collection.to_csv(options[:from_day], options[:to_day])
end

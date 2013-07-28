json.array!(@assignments) do |assignment|
  json.extract! assignment, :title, :description, :due_date, :course_id, :active
  json.url assignment_url(assignment, format: :json)
end

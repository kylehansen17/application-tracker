puts "Cleaning database..."
Note.destroy_all
Application.destroy_all
User.destroy_all

puts "Creating user..."
user = User.create!(
  email: "kyle@mail.com",
  password: "password"
)

puts "Creating applications..."

applications = [
  { company_name: "Stripe", job_title: "Backend Engineer", status: :applied },
  { company_name: "Shopify", job_title: "Ruby Developer", status: :interview },
  { company_name: "GitHub", job_title: "Software Engineer", status: :rejected },
  { company_name: "Airbnb", job_title: "Full Stack Developer", status: :applied },
  { company_name: "Notion", job_title: "Product Engineer", status: :interview },
  { company_name: "Square", job_title: "Backend Developer", status: :offer },
  { company_name: "Atlassian", job_title: "Software Engineer", status: :applied },
  { company_name: "Basecamp", job_title: "Rails Developer", status: :applied },
  { company_name: "Netflix", job_title: "Platform Engineer", status: :rejected },
  { company_name: "OpenAI", job_title: "Software Engineer", status: :interview }
]

applications.each do |attrs|
  application = Application.create!(
    user: user,
    company_name: attrs[:company_name],
    job_title: attrs[:job_title],
    status: attrs[:status],
    applied_at: rand(1..30).days.ago,
    job_url: "https://careers.example.com"
  )

  Note.create!(
    application: application,
    content: "Initial application submitted. Follow up in one week."
  )
end

puts "Seeding complete!"

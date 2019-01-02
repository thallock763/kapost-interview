FactoryBot.define do
  factory :short_link do
    long_url { "http://www.kapost.com" }
    short_url { "http://localhost:3000/12ab4" }
  end
end

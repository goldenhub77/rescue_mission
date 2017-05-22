require 'rails_helper'

RSpec.describe ApplicationRecord, type: :model do
  it '#self.to_markdown' do
    h2_heading = "##This is an h2 heading"
    numbered_list = "1. this is number one\n2. this is number two"
    paragraph = "This is a simple string that will be a paragragh"
    expect(ApplicationRecord.to_markdown(h2_heading)).to eq("<h2>This is an h2 heading</h2>\n")
    expect(ApplicationRecord.to_markdown(numbered_list)).to eq("<ol>\n<li>this is number one</li>\n<li>this is number two</li>\n</ol>\n")
    expect(ApplicationRecord.to_markdown(paragraph)).to eq("<p>This is a simple string that will be a paragragh</p>\n")
  end
end

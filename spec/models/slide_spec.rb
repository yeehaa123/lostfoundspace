require 'spec_helper'

describe Slide do
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:subtitle) }
  it { should allow_mass_assignment_of(:content) }
  it { should allow_mass_assignment_of(:image_url) }
  it { should allow_mass_assignment_of(:main_order) }
  it { should allow_mass_assignment_of(:sub_order) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:subtitle) }
  it { should validate_presence_of(:main_order) }
  it { should validate_presence_of(:sub_order) }
end

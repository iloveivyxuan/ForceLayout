require 'spec_helper'

RSpec.describe ForceLayout::Point, 'point' do
  before(:all) do
    position = ForceLayout::Vector.new(1, 2, 3)
    @point = ForceLayout::Point.new(position, 'id')
  end

  context 'Accelerate' do
    it 'can update its accelerate' do
      force = ForceLayout::Vector.new(2, 3, 4)
      accelerate = @point.update_accelerate(force)
      expect(accelerate.x).to eq 2
      expect(accelerate.y).to eq 3
      expect(accelerate.z).to eq 4
    end
  end

  context 'Force between points' do
    it 'apply coulombs law' do
      expect(@point.accelerate.x).to eq 2
      another_point = ForceLayout::Point.new(ForceLayout::Vector.new(2, 3, 4), 'another_id')
      @point.apply_coulombs_law(another_point)
      expect(@point.accelerate.x).not_to eq 2
    end
  end
end

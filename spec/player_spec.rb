require 'spec_helper'
require 'gosu'

describe Player do
  let(:gosu_window) { double(Gosu::Window) }
  let(:beep_path) { 'app/media/Beep.wav' }
  let(:block) { double('block') }

  before do
    allow(Block).to receive(:new).and_return(block)
  end

  it 'create a valid instance of player' do
    expect(Gosu::Sample).to receive(:new).with(gosu_window, beep_path)
    @player = Player.new(gosu_window)
  end

  describe 'with a valid player object' do
    before do
      allow(Gosu::Sample).to receive(:new).with(gosu_window, beep_path)
      @player = Player.new(gosu_window)
    end

    describe '#turn' do
      it 'sets @direction with direction argument' do
        @player.turn(:left)
        expect(@player.direction).to eq(:left)
      end
    end
  end

end

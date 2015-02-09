require 'spec_helper'
require 'gosu'

describe Block do
  let(:gosu_window) { double(Gosu::Window) }
  let(:gosu_image) { double(Gosu::Image, width: 20, height: 20) }
  let(:image_path) { 'app/media/block_3.png' }
 
  describe 'initial settings' do
    it 'creates an instance of Gosu::Image to represent the block' do
      allow(Gosu::Image).to receive(:new).with(gosu_window, image_path, false)
	.and_return(gosu_image)
      Block.new(gosu_window) 
    end     
  end

  describe '#locate_at' do
    before do
      allow(Gosu::Image).to receive(:new).and_return(gosu_image)
      @block = Block.new(gosu_window)
    end

    context 'if is called with no args' do
      it 'locate the block on a random position' do
        @block.locate_at
        values_1 = "#{@block.x}#{@block.y}"
        @block.locate_at
        values_2 = "#{@block.x}#{@block.y}"
        @block.locate_at
        values_3 = "#{@block.x}#{@block.y}"
        expect((values_1==values_2)==values_3).to eq(false)
      end
    end

   context 'if is called with args' do
     it 'locate the block on the specified position' do
       expected_values = { x: 220, y: 150 }
       @block.locate_at(expected_values)
       expect(@block.x).to eq(expected_values[:x])
       expect(@block.y).to eq(expected_values[:y])
     end

     context 'if args hash do not have x and y keys' do
       it 'locate the block at random positions' do
         params = { z: 220, w: 150 }
         @block.locate_at(params)
         first_values = "#{@block.x}#{@block.y}"
         @block.locate_at(params)
         expect("#{@block.x}#{@block.y}").to_not eq(first_values)
       end
     end
   end

   describe '#move' do
     before do
       allow(Gosu::Image).to receive(:new).and_return(gosu_image)
       @block = Block.new(gosu_window)
       @block.locate_at({x: 200, y: 200})
     end

     it 'moves to block to the left' do
       expect{@block.move(:left)}.to change{@block.x}.by(-@block.width) 
     end

     it 'moves the block to the right' do
       expect{@block.move(:right)}.to change{@block.x}.by(@block.width)
     end

     it 'moves the block up' do
       expect{@block.move(:up)}.to change{@block.y}.by(-@block.height)
     end

     it 'moves the block down' do
       expect{@block.move(:down)}.to change{@block.y}.by(@block.height)
     end

     it 'does not move the block if receive incorrect params' do
       positions = "#{@block.x}#{@block.y}"
       @block.move(:something)
       expect("#{@block.x}#{@block.y}").to eq(positions)
     end

     describe '.set_boundary' do
       it 'calls to set_boundary after move the block' do
         expect(@block).to receive(:set_boundary)
         @block.move(:up)
       end

       it 'place the block inside the game area' do
         @block.locate_at({x: 660, y: 500})
         @block.move(:something)
         expect(@block.x).to eq(20)
         expect(@block.y).to eq(20)
       end
     end
   end

   describe '#draw' do
     it 'calls to draw on @block_image with the right params' do
       allow(gosu_image).to receive(:draw).with(@block.x, @block.y, 1)
       @block.draw
     end
   end

  end
end

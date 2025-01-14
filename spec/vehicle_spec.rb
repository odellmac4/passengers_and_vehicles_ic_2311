require 'pry'
require './lib/passenger'
require './lib/vehicle'

RSpec.describe Vehicle do
    before(:each) do
        @vehicle = Vehicle.new("2001", "Honda", "Civic")
        @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
        @jude = Passenger.new({"name" => "Jude", "age" => 20})
        @taylor = Passenger.new({"name" => "Taylor", "age" => 12})   
    end
  
    describe '#initialize' do
      it 'can initialize' do
        expect(@vehicle).to be_an_instance_of(Vehicle)
      end

      it 'has a year' do
        expect(@vehicle.year).to eq("2001")
      end

      it 'has a make' do
        expect(@vehicle.make).to eq("Honda")
      end

      it 'has a model' do
        expect(@vehicle.model).to eq ("Civic")
      end
    end

    describe '#speeding?' do 

        it 'is not speeding' do

            expect(@vehicle.speeding?).to eq(false)
        end

        it 'speeds' do
            expect(@vehicle.speeding?).to eq(false)

            @vehicle.speed
            expect(@vehicle.speeding?).to eq(true)
        end
    end

    describe '#passengers' do

        it 'has passengers' do
            expect(@vehicle.passengers).to eq ([])
        end
        
        it 'can add passengers' do
            expect(@vehicle.passengers).to eq ([])
            
            @vehicle.add_passenger(@charlie)
            @vehicle.add_passenger(@jude)
            @vehicle.add_passenger(@taylor)
            expect(@vehicle.passengers).to eq ([@charlie, @jude, @taylor]) 
        end

        it 'counts number of adults' do
            @vehicle.add_passenger(@charlie)
            @vehicle.add_passenger(@jude)
            @vehicle.add_passenger(@taylor)
            expect(@vehicle.num_adults).to eq(2)
        end

    end
end
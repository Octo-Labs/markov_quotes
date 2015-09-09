require 'spec_helper'

RSpec.describe MarkovChainer do
  before :each do
    @chainer = MarkovChainer.new
  end
  describe "train" do
    it "should accept a sentence" do
      expect {
        @chainer.train("This is a test message")
      }.to_not raise_error
    end
  end
  describe "generate" do
    describe "with one sentece" do
      before :each do
        @sentence = "This should come back un-changed."
        @chainer.train(@sentence)
      end
      it "should return the original sentence" do
        expect(@chainer.generate).to eq(@sentence)
      end
    end

    describe "with two senteces" do
      before :each do
        @chainer.train("Rob loves Ruby")
        @chainer.train("Jesse loves Javascript")
      end
      it "should mix the sentences" do
        results = {}
        20.times do
          new_sentence = @chainer.generate
          results[new_sentence] ||= 0
          results[new_sentence] += 1
        end
        expect(results["Rob loves Javascript"]).to be > 0
      end
    end
  end
end

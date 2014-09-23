require "spec_helper"

describe "hydroponics" do
  it "takes a file path as argument" do
    Hydroponics.new("./data/metrics.tsv")
  end

  it "returns a hash with averages" do
    container = Hydroponics.new("./data/metrics.tsv")
    averages = container.averages(1)
    expected_output = {
      container: 1,
      ph: 5.01,
      nsl: 39.02,
      temp: 57.76,
      water_level: 2.12
    }
    {
      container: 2,
      ph: 5.95,
      nsl: 19.77,
      temp: 73.06,
      water_level: 3.8
    }
    {
      container: 3,
      ph: 7.01,
      nsl: 10.97,
      temp: 67.61,
      water_level: 4.7
    }
    expect(averages).to eq(expected_output)
  end

  it "returns highest average temp" do
    container = Hydroponics.new("./data/metrics.tsv")
    highest_average = container
    expected_output = "container2"
    expect(highest_average).to eq(expected_output)
  end
  it "returns highest water level" do
    container = Hydroponics.new("./data/metrics.tsv")
    highest_average = container
    expected_output = "container3"
    expect(highest_average).to eq(expected_output)
  end
end

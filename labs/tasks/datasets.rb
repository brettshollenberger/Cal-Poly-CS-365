def dataset(name)
  file "datasets/#{name}.zip" do
    url = "http://users.csc.calpoly.edu/~dekhtyar/365-Winter2013/data/#{name.upcase}/#{name.upcase}.zip"
    sh "curl #{url} > datasets/#{name}.zip"
  end

  file "datasets/#{name}" => "datasets/#{name}.zip" do
    cd "datasets" do
      sh "unzip #{name}.zip -d #{name}"
    end
  end
end

def datasets(*names)
  names.each do |name|
    dataset name
  end
end

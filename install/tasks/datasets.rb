def dataset(name)
  file "install/datasets/#{name}.zip" do
    url = "http://users.csc.calpoly.edu/~dekhtyar/365-Winter2013/data/#{name.upcase}/#{name.upcase}.zip"
    sh "curl #{url} > install/datasets/#{name}.zip"
  end

  file "install/datasets/#{name}" => "install/datasets/#{name}.zip" do
    cd "install/datasets" do
      sh "unzip #{name}.zip -d #{name}"
    end
  end
end

def datasets(*names)
  names.each do |name|
    dataset name
  end
end

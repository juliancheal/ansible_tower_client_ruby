describe AnsibleTowerClient::Group do
  let(:url)                 { "example.com/api/v1/group_update/10" }
  let(:api)                 { AnsibleTowerClient::Api.new(instance_double("Faraday::Connection")) }
  let(:collection)          { api.groups }
  let(:raw_collection)      { build(:response_collection, :klass => described_class) }
  let(:raw_url_collection)  { build(:response_url_collection, :klass => described_class, :url => url) }
  let(:raw_instance)        { build(:response_instance, :group, :klass => described_class) }

  include_examples "Collection Methods"

  it "#initialize instantiates an #{described_class} from a hash" do
    obj = described_class.new(instance_double("AnsibleTowerClient::Api"), raw_instance)

    expect(obj).to              be_a described_class
    expect(obj.id).to           be_a Integer
    expect(obj.inventory_id).to be_a Integer
    expect(obj.name).to         be_a String
  end
end

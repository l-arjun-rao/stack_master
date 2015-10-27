RSpec.describe StackMaster::Config::StackDefinition do
  subject(:stack_definition) do
    StackMaster::Config::StackDefinition.new(
      region: region,
      stack_name: stack_name,
      template: template,
      tags: tags,
      base_dir: base_dir)
  end

  let(:region) { 'us-east-1' }
  let(:stack_name) { 'stack_name' }
  let(:template) { 'template.json' }
  let(:tags) { {'environment' => 'production'} }
  let(:base_dir) { '/base_dir' }

  describe "#template_body" do
    it "reads from the template file path" do
      expect(File).to receive(:read).with('/base_dir/templates/template.json').and_return('body')

      expect(stack_definition.template_body).to eq('body')
    end
  end
end
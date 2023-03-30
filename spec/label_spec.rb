require_relative '../lib/label'
require_relative '../lib/item'

describe Label do
    context 'Test the Label class' do
        it 'Create an instance object of the class label' do
            label_one = Label.new(title: 'Iliada', color: 'Black')
            expect(label_one).to be_instance_of(Label)
        end
    end
end
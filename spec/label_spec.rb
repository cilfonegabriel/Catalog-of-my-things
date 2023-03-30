require_relative '../lib/label'
require_relative '../lib/item'

describe Label do
    context 'Test the Label class' do
        it 'Create an instance object of the class label' do
            label_one = Label.new(title: 'Iliada', color: 'Black')
            expect(label_one).to be_instance_of(Label)
        end
        
        it 'Add a new item to the items array' do
            label_one = Label.new(title: 'Iliada', color: 'Black')
            item_one = Item.new(publish_date: '2020-06-06')
            label_one.add_item(item_one)
            expect(label_one.items).to include(item_one)
        end

        it 'Check that it is inside the item instance' do
            label_one = Label.new(title: 'Iliada', color: 'Black')
            item_one = Item.new(publish_date: '2020-06-06')
            label_one.add_item(item_one)
            expect(item_one.label).to eq label_one
        end
    end
end
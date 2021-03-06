require 'spec_helper'

describe LineItemsController do
  before(:each) { @line_item = FactoryGirl.create(:line_item) }
  login_admin

  describe "GET index" do
    it "should get index" do
      get :index
      response.should be_success
    end

    it "assigns all line_items as @line_items" do
      get :index
      assigns(:line_items).should eq([@line_item])
    end
  end

  describe "GET show" do
    it "assigns the requested line_item as @line_item" do
      get :show, { id: @line_item.to_param }
      assigns(:line_item).should eq(@line_item)
    end
  end

  describe "GET new" do
    it "assigns a new line_item as @line_item" do
      get :new
      assigns(:line_item).should be_a_new(LineItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested line_item as @line_item" do
      get :edit, { id: @line_item.to_param }
      assigns(:line_item).should eq(@line_item)
    end
  end

  describe "POST create" do
    before do
      product = FactoryGirl.create(:product, title: 'Octo Hipster')
      Product.stub(:find).and_return(product)
    end

    context "with valid params" do
      it "creates a new LineItem" do
        expect { post :create }.to change(LineItem, :count).by(1)
      end

      it "assigns a newly created line_item as @line_item" do
        post :create
        assigns(:line_item).should be_a(LineItem)
        assigns(:line_item).should be_persisted
      end

      it "redirects to the root path" do
        post :create
        response.should redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved line_item as @line_item" do
        LineItem.any_instance.stub(:save).and_return(false)
        post :create
        assigns(:line_item).should be_a_new(LineItem)
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      it "updates the requested line_item" do
        LineItem.any_instance.should_receive(:update_attributes).with({ 'these' => 'params' })
        put :update, { id: @line_item.to_param, line_item: { 'these' => 'params' } }
      end

      it "assigns the requested line_item as @line_item" do
        put :update, { id: @line_item.to_param, line_item: { quantity: 2 } }
        assigns(:line_item).should eq(@line_item)
      end

      it "redirects to the line_item" do
        put :update, { id: @line_item.to_param, line_item: { quantity: 2 } }
        response.should redirect_to(@line_item)
      end
    end

    context "with invalid params" do
      it "assigns the line_item as @line_item" do
        LineItem.any_instance.stub(:save).and_return(false)
        put :update, { id: @line_item.to_param, line_item: {} }
        assigns(:line_item).should eq(@line_item)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested line_item" do
      expect {
        delete :destroy, { id: @line_item.to_param }
      }.to change(LineItem, :count).by(-1)
    end

    it "redirects to the line_items list" do
      delete :destroy, { id: @line_item.to_param }
      response.should redirect_to(root_path)
    end
  end
end

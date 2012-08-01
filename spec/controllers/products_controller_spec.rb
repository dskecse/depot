require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ProductsController do
  before(:each) { @product = FactoryGirl.create(:product) }

  describe "GET index" do
    it "assigns all products as @products" do
      get :index
      assigns(:products).should eq([@product])
    end
  end

  describe "GET show" do
    it "assigns the requested product as @product" do
      get :show, { id: @product.to_param }
      assigns(:product).should eq(@product)
    end
  end

  describe "GET new" do
    it "assigns a new product as @product" do
      get :new
      assigns(:product).should be_a_new(Product)
    end
  end

  describe "GET edit" do
    it "assigns the requested product as @product" do
      get :edit, { id: @product.to_param }
      assigns(:product).should eq(@product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, { product: { title: 'Drunken Octo Hipster', description: 'MyText', image_url: 'ruby.jpg', price: 9.99 } }
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, { product: { title: 'Drunken Octo Hipster', description: 'MyText', image_url: 'ruby.jpg', price: 9.99 } }
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end

      it "redirects to the created product" do
        post :create, { product: { title: 'Drunken Octo Hipster', description: 'MyText', image_url: 'ruby.jpg', price: 9.99 } }
        response.should redirect_to(Product.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        post :create, { product: {} }
        assigns(:product).should be_a_new(Product)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested product" do
        # Assuming there are no other products in the database, this
        # specifies that the Product created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Product.any_instance.should_receive(:update_attributes).with({ 'price' => @product.price.to_s })
        put :update, { id: @product.to_param, product: { price: @product.price } }
      end

      it "assigns the requested product as @product" do
        put :update, { id: @product.to_param, product: { price: @product.price } }
        assigns(:product).should eq(@product)
      end

      it "redirects to the product" do
        put :update, { id: @product.to_param, product: { title: 'Drunken Octo Hipster', description: 'MyText', image_url: 'ruby.jpg', price: 9.99 } }
        response.should redirect_to(@product)
      end
    end

    describe "with invalid params" do
      it "assigns the product as @product" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        put :update, { id: @product.to_param, product: {} }
        assigns(:product).should eq(@product)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested product" do
      expect {
        delete :destroy, { id: @product.to_param }
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      delete :destroy, { id: @product.to_param }
      response.should redirect_to(products_url)
    end
  end

end

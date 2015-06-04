class ExampleModulesController < ApplicationController
  before_action :set_example_module, only: [:show, :edit, :update, :destroy]

  # GET /example_modules
  # GET /example_modules.json
  def index
    @example_modules = ExampleModule.all
  end

  # GET /example_modules/1
  # GET /example_modules/1.json
  def show
  end

  # GET /example_modules/new
  def new
    @example_module = ExampleModule.new
  end

  # GET /example_modules/1/edit
  def edit
  end

  # POST /example_modules
  # POST /example_modules.json
  def create
    @example_module = ExampleModule.new(example_module_params)

    respond_to do |format|
      if @example_module.save
        format.html { redirect_to @example_module, notice: 'Example module was successfully created.' }
        format.json { render :show, status: :created, location: @example_module }
      else
        format.html { render :new }
        format.json { render json: @example_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /example_modules/1
  # PATCH/PUT /example_modules/1.json
  def update
    respond_to do |format|
      if @example_module.update(example_module_params)
        format.html { redirect_to @example_module, notice: 'Example module was successfully updated.' }
        format.json { render :show, status: :ok, location: @example_module }
      else
        format.html { render :edit }
        format.json { render json: @example_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /example_modules/1
  # DELETE /example_modules/1.json
  def destroy
    @example_module.destroy
    respond_to do |format|
      format.html { redirect_to example_modules_url, notice: 'Example module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example_module
      @example_module = ExampleModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_module_params
      params.require(:example_module).permit(:title, :text)
    end
end

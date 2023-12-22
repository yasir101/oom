class CompanyAssetsController < ApplicationController
  def index
    @company_assets = CompanyAsset.all
  end

  def new
    @company_asset = CompanyAsset.new
  end

  def create
    @company_asset = CompanyAsset.new(company_assets_params)
    if @company_asset.save
      redirect_to new_company_asset_path 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @company_asset = CompanyAsset.find_by(id: params['id'])
  end

  private

  def company_assets_params
    params.require(:company_asset).permit(:name, :quantity, :description)
  end
end

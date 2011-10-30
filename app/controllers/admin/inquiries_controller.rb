class Admin::InquiriesController < Admin::ResourceController

  def collection
    return @collection if @collection.present?
    unless request.xhr?
      # @search = Inquiry.search(params[:search])
      # 
      # #set order by to default or form result
      # @search.order ||= "ascend_by_email"
      # 
      # @collection = @search.paginate(:per_page => Spree::Config[:admin_products_per_page], :page => params[:page])
      
      params[:search] ||= {}
      params[:search][:meta_sort] ||= "name.asc"
      @search = super.metasearch(params[:search])
      @collection = @search.relation.page(params[:page]).per(Spree::Config[:per_page])
    else
      @collection = Inquiry.find(:all, :limit => (params[:limit] || 100))
    end
  end
  
  def destroy
    @inquiry.destroy
    respond_with(@inquiry) { |format| format.js { render_js_for_destroy } }
  end

end

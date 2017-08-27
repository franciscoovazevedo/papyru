class DocumentsController < ApplicationController
  def new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def document_params
    params.require(:document).permit(:filetype)
  end
end

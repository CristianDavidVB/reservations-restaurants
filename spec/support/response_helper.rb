module ResponseHelper
  def response_data
    JSON.parse(response.body)['data']
  end
end
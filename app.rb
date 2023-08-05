require 'sinatra'
require "chroma-db"

Chroma.connect_host = ENV['CHROMA_URL'] || "http://localhost:8000"
Chroma.logger = Logger.new($stdout)
Chroma.log_level = Chroma::LEVEL_ERROR

PAGE_SIZE = 100

get '/' do
  @collections = get_all_collections
  @current_collection = get_current_collection || @collections.first
  @records = get_records(@current_collection)
  @total_records_count = get_total_records_count(@current_collection)
  @prev_page_number = get_prev_page_number
  @next_page_number = get_next_page_number(@total_records_count)
  erb :index
end

def get_all_collections
  Chroma::Resources::Collection.list
end

def get_current_collection
  Chroma::Resources::Collection.get(params[:collection]) if params[:collection]
end

def get_records(collection)
  return [] unless collection

  collection.get(page: current_page_number, page_size: PAGE_SIZE, include: [:metadatas, :documents, :embeddings])
end

def get_total_records_count(collection)
  return 0 unless collection

  collection.count
end

def current_page_number
  (params[:page] || 1).to_i
end

def get_prev_page_number
  return if current_page_number == 1

  current_page_number - 1
end

def get_next_page_number(total_records_count)
  last_page = (total_records_count / PAGE_SIZE) + 1
  return if current_page_number == last_page

  current_page_number + 1
end

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end

  def ellipsis(str, length)
    return unless str
    if str.length > length
      str.slice(0, length) + '...'
    else
      str
    end
  end
end

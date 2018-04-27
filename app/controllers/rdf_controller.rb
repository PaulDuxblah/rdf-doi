require 'rdf'
require 'rdf/vocab'
require 'rdf/ntriples'
require 'linkeddata'

class RdfController < ApplicationController
  DOI_BASE_URL = 'http://dx.doi.org/'

  DC = RDF::Vocab::DC
  FOAF = RDF::Vocab::FOAF

  def index
    if params['path']
      @doi = params['path']
      @data = loadDC(@doi)
    end
  end

  def getGraph(url)
    begin
      RDF::Graph.load(url, format: :ttl)
    rescue
      return
    end
  end

  def getEmptyData
    {
      date: nil,
      makers: [],
      publisher: nil,
      title: nil
    }
  end

  def getDoiUrl(doi)
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts 'mario'
    puts DOI_BASE_URL
    puts doi
    DOI_BASE_URL + doi
  end

  def loadDC(doi)
    graph = getGraph(getDoiUrl(doi))

    if !graph
      redirect_to "/"
      return
    end

    data = getEmptyData()
    data[:url] = getDoiUrl(doi)

    query = RDF::Query.new({
      data: {
        DC.publisher => :publisher,
        DC.date => :date
      }
    })

    query.execute(graph) do |solution|
      data[:publisher] = solution.publisher
      data[:date] = solution.date
    end

    titleQuery = RDF::Query.new({
      data: {
        DC.title => :title
      }
    })

    titleQuery.execute(graph) do |solution|
      data[:title] = solution.title
    end

    makerQuery = RDF::Query.new({
      person: {
        RDF.type  => FOAF.Person,
        FOAF.name => :name
      }
    })

    makerQuery.execute(graph) do |solution|
      data[:makers].push(solution.name)
    end

    data
  end
end

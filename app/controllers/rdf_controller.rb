require 'rdf'
require 'rdf/vocab'
require 'rdf/ntriples'
require 'linkeddata'

class RdfController < ApplicationController
  DOI_BASE_URL = 'http://dx.doi.org/'
  FOAF = RDF::Vocab::FOAF
  DC = RDF::Vocab::DC
  DC11 = RDF::Vocab::DC11

  def index

  end

  def graph
    graph = RDF::Graph.load(DOI_BASE_URL + params['path'], format: :ttl)

    @data = {
      url: DOI_BASE_URL + params['path'],
      date: nil,
      title: nil,
      publisher: nil
    }

    query = RDF::Query.new({
      data: {
        DC.publisher => :publisher,
        DC.date => :date
      }
    })

    query.execute(graph) do |solution|
      @data[:publisher] = solution.publisher
      @data[:date] = solution.date
    end

    titleQuery = RDF::Query.new({
      data: {
        DC.title => :title
      }
    })

    titleQuery.execute(graph) do |solution|
      @data[:title] = solution.title
    end
  end
end

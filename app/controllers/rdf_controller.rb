require 'rdf'
require 'rdf/vocab'
require 'rdf/ntriples'

class RdfController < ApplicationController
  DOI_BASE_URL = 'http://dx.doi.org/'

  def index

  end

  def submit
    begin
      @graph = RDF::Graph.load(DOI_BASE_URL + params['id'], format: :ttl)
      debugger

      solutions = RDF::Query.execute(@graph, {
        person: {
          RDF.type => FOAF.Person,
        }
      })
      debugger

      # @graph = RDF::Graph.load("etc/doap.nt")

      puts @graph.query(predicate: RDF::Vocab::FOAF.name)

      @statements = []
      # RDF::Reader.open( DOI_BASE_URL + params['id'], format: RDF::Format.for(:ntriples) ) do |reader|
      #   @reader = reader
      #   # reader.each_statement do |statement|
      #   #   @statements.push(statement)
      #   # end
      # end
      # @graph = RDF::Graph.load("http://ruby-rdf.github.com/rdf/etc/doap.nt")
      # @graph = RDF::Graph.load("http://dbpedia.org/resource/Elvis_Presley")
      # @graph = RDF::Graph.load('http://njh.me/foaf.rdf')
    rescue => ex
      puts ex
      redirect_to "/"
    end
  end
end

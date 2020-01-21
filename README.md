# README
* docker deployment
  * download repo
  * cd into repo directory
  * Set environment variables `DEVISE_JWT_SECRET_KEY` and `DATABASE_PASSWORD`
  * run docker-compose up
 
* Set up
  * Download the repo
  * Install dependencies with > bundle
  * Set environment variables `DEVISE_JWT_SECRET_KEY` and `DATABASE_PASSWORD`
  * Run bundle exec rake environment elasticsearch:import:model CLASS='Question' FORCE=true
  * Start the server with > foreman start
  * docker run --name elasticsearch -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.3.0
  * bundle exec rake environment elasticsearch:import:model CLASS='Question' FORCE=true

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


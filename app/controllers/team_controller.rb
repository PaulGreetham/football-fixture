class TeamController < ApplicationController

  def index

    def search
      team = find_team(params[:name])

      unless team
        flash[:alert] = 'Team not found'
        return render action: :index
      end
    end

# app/controllers/team_controller.rb
    private

    def request_api(url)
      response = Excon.get(
        url,
        headers: {
          'X-RapidAPI-Host' => URI.parse(url).host,
          'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
      }
    )

      return nil if response.status != 200

      JSON.parse(response.body)
    end

    def find_team(name)
      request_api(
        'https://api-football-v1.p.rapidapi.com/v3/teams/'
      )
    end
  end
end

# Copyright (C) 2014 Andrey Antukh <niwi@niwi.be>
# Copyright (C) 2014 Jesús Espino Garcia <jespinog@gmail.com>
# Copyright (C) 2014 David Barragán Merino <bameda@dbarragan.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.


class ConfigService
    defaults: {
        host: "localhost:8000"
        scheme: "http"
        defaultLanguage: "en"
        debug: false
        notificationLevelOptions: {
            all_owned_projects: "All events on my projects"
            only_watching: "Only events for objects i watch"
            only_assigned: "Only events for objects assigned to me"
            only_owner: "Only events for objects owned by me"
            no_events: "No events"
        }
        languageOptions: {
            es: "Spanish"
            en: "English"
        }
        gitHubClientId: undefined
        gitHubAuthUrl: "https://github.com/login/oauth/authorize"
    }

    initialize: (localconfig) ->
        defaults = _.clone(@.defaults, true)
        @.config = _.merge(defaults, localconfig)

    get: (key, defaultValue=null) ->
        return @.config[key] || defaultValue

module = angular.module("gmConfig", [])
module.service("$gmConfig", ConfigService)

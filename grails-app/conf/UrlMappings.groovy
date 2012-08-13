class UrlMappings {

    static mappings = {

        /*"/twit/data/"(controller:"twit") {
            action=[GET:"data"]
        }*/


        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "/index")
        "500"(view: '/error')
    }
}

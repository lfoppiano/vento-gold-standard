package vento.reports

import org.springframework.dao.DataIntegrityViolationException

class TwitController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "menu", params: params)
    }

    def list() {
        def twitInstanceList = []
        def twitInstanceTotal = 0

        params.max = Math.min(params.max ? params.int('max') : 10, 100)


        if (params.query) {
            twitInstanceList = Twit.findAllByQuery(params.query, params)
            twitInstanceTotal = Twit.countByQuery(params.query)
        } else {
            twitInstanceList = Twit.list(params)
            twitInstanceTotal = Twit.count()
        }

        [twitInstanceList: twitInstanceList, twitInstanceTotal: twitInstanceTotal]
    }

    def generalStatistics() {
        def totalTwitterTwits = Twit.count()

        def queries = Twit.queries.list()
        def totalQueries  = queries.size()

        def brandStatistics = [:]

        queries.each {
            brandStatistics[it] = [
                    countByQuery: Twit.countByQuery(it),
                    totNegative: 0,
                    totPositive: 0,
                    totNeutral: 0,
                    mismatch: 0,
                    match: 0
            ]
            Twit.findAllByQuery(it).each { query ->
                switch (query.score) {
                    case '1.0':
                        brandStatistics[it]['totNegative']++
                        break
                    case '2.0':
                        brandStatistics[it]['totNeutral']++
                        break
                    case '3.0':
                        brandStatistics[it]['totPositive']++
                        break
                }

                if(query.score != query.referenceScore) {
                    brandStatistics[it]['mismatch']++
                }else {
                    brandStatistics[it]['match']++
                }
            }

        }




        [totalTwits: totalTwitterTwits, totalQueries:  totalQueries, totalPerQuery: brandStatistics]


    }

    def create() {
        [twitInstance: new Twit(params)]
    }

    def menu() {
        [twitQueryList: Twit.queries.list().sort()]
    }

    def save() {
        def twitInstance = new Twit(params)
        if (!twitInstance.save(flush: true)) {
            render(view: "create", model: [twitInstance: twitInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'twit.label', default: 'Twit'), twitInstance.id])
        redirect(action: "show", id: twitInstance.id)
    }

    def show() {
        def twitInstance = Twit.get(params.id)
        if (!twitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'twit.label', default: 'Twit'), params.id])
            redirect(action: "list")
            return
        }

        [twitInstance: twitInstance]
    }

    def edit() {
        def twitInstance = Twit.get(params.id)
        if (!twitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'twit.label', default: 'Twit'), params.id])
            redirect(action: "list")
            return
        }

        [twitInstance: twitInstance]
    }

    def update() {
        def twitInstance = Twit.get(params.id)
        if (!twitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'twit.label', default: 'Twit'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (twitInstance.version > version) {
                twitInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'twit.label', default: 'Twit')] as Object[],
                        "Another user has updated this Twit while you were editing")
                render(view: "edit", model: [twitInstance: twitInstance])
                return
            }
        }

        twitInstance.properties = params

        if (!twitInstance.save(flush: true)) {
            render(view: "edit", model: [twitInstance: twitInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'twit.label', default: 'Twit'), twitInstance.id])
        redirect(action: "show", id: twitInstance.id)
    }

    def delete() {
        def twitInstance = Twit.get(params.id)
        if (!twitInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'twit.label', default: 'Twit'), params.id])
            redirect(action: "list")
            return
        }

        try {
            twitInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'twit.label', default: 'Twit'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'twit.label', default: 'Twit'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}

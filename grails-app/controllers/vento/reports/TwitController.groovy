package vento.reports

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException
import org.vento.statistics.general.GeneralStatisticRow

class TwitController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "menu", params: params)
    }

    def data() {

        params.offset = params.iDisplayStart ?: 0
        params.max = Math.min(params.iDisplayLength ? params.int('iDisplayLength') : 10, 100)

        def propertiesToRender = [
                'id',
                'query',
                'text',
                'score',
                'referenceScore',
                'createdAt'
        ]

        params.sort = propertiesToRender[Integer.parseInt(params.iSortCol_0)]
        params.order = params.sSortDir_0

        def dataToRender = [:]
        dataToRender.aaData = []

        def rawData = []

        if (params.query) {
            def query = Twit.selectByQuery(params.query)
            if(params.sSearch){
                query = Twit.searchOnQuery(params.query, params.sSearch)
            }
            rawData = query.list(params)
            dataToRender.iTotalRecords = query.count()
        } else {
            if (params.sSearch) {
                def query = Twit.searchTwit(params.sSearch)
                rawData = query.list(params)
                dataToRender.iTotalRecords = query.count()
            } else {
                rawData = Twit.list(params)
                dataToRender.iTotalRecords = Twit.count()
            }
        }

        dataToRender.iTotalDisplayRecords = dataToRender.iTotalRecords

        rawData.each { twit ->
            def record = []

            propertiesToRender.each {
                record << twit."${it}"
            }
            dataToRender.aaData << record

        }

        render dataToRender as JSON
    }

    def list() {
        //Work done with JavaScript. See data method.
    }

    def generalStatistics() {
        def totalElements = Twit.count()

        def queries = Twit.queries.list()
        def totalQueries = queries.size()

        def statisticList = []

        queries.each {
            GeneralStatisticRow row = new GeneralStatisticRow()

            row.totalElements = Twit.countByQuery(it)
            row.totalNegative = Twit.countByQueryAndScore(it, '1.0')
            row.totalPositive = Twit.countByQueryAndScore(it, '3.0')
            row.totalNeutral = Twit.countByQueryAndScore(it, '2.0')

            row.totalRefMismatches = Twit.countByQuery(it) { score != referenceScore }
            row.totalRefMatches = Twit.countByQuery(it) { score.equals(referenceScore) }
            row.query = it

            statisticList.add(row)
        }

        [totalElements: totalElements, totalQueries: totalQueries, statisticList: statisticList]


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

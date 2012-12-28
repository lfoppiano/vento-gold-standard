package vento.reports

import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import org.junit.Before
import org.vento.utility.VentoTypes

@TestFor(TwitController)
@Mock(Twit)
class TwitControllerTests {

    @Before
    void setUp() {
        Twit t1 = new Twit(
                text: "costamasnaga",
                query:  "amazon",
                type: VentoTypes.CLASSIFICATION
        )
        t1.save(flush: true, validate: false)

        Twit t2 = new Twit(
                text:  "smacsnego",
                query: "amazon",
                score:  "1.0",
                type: VentoTypes.CLASSIFICATION

        )
        t2.save(flush: true, validate: false)
    }

    void testNQonlyClassification() {
        assert Twit.onlyClassification().count() == 1
        assert Twit.onlyClassification().list().get(0).type == VentoTypes.CLASSIFICATION
        assert Twit.onlyClassification().list().get(0).score != null
    }

    void testNQbyQuery() {
        assert Twit.byQuery("apple").count() == 0
        assert Twit.byQuery("amazon").count() == 1

        assert Twit.byQuery("amazon").list().get(0).type == VentoTypes.CLASSIFICATION
        assert Twit.byQuery("amazon").list().get(0).score != null
        assert Twit.byQuery("amazon").list().get(0).query == "amazon"
    }

    void testNQsearch(){
        assert Twit.search("smac").count() == 1;
        assert Twit.search("smac").list().get(0).text == "smacsnego"
    }

    void testNQbyQueryAndSearch(){
        assert Twit.byQueryAndSearch("amazon", "smac").count() == 1;
        assert Twit.byQueryAndSearch("amazon", "smac").list().get(0).text == "smacsnego"
    }

    void testGetData() {
        def params = []
        params['order'] = 0;

        println controller.data()
    }

     /*
    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/twit/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.twitInstanceList.size() == 0
        assert model.twitInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.twitInstance != null
    }

    void testSave() {
        controller.save()

        assert model.twitInstance != null
        assert view == '/twit/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/twit/show/1'
        assert controller.flash.message != null
        assert Twit.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/twit/list'


        populateValidParams(params)
        def twit = new Twit(params)

        assert twit.save() != null

        params.id = twit.id

        def model = controller.show()

        assert model.twitInstance == twit
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/twit/list'


        populateValidParams(params)
        def twit = new Twit(params)

        assert twit.save() != null

        params.id = twit.id

        def model = controller.edit()

        assert model.twitInstance == twit
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/twit/list'

        response.reset()


        populateValidParams(params)
        def twit = new Twit(params)

        assert twit.save() != null

        // test invalid parameters in update
        params.id = twit.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/twit/edit"
        assert model.twitInstance != null

        twit.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/twit/show/$twit.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        twit.clearErrors()

        populateValidParams(params)
        params.id = twit.id
        params.version = -1
        controller.update()

        assert view == "/twit/edit"
        assert model.twitInstance != null
        assert model.twitInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/twit/list'

        response.reset()

        populateValidParams(params)
        def twit = new Twit(params)

        assert twit.save() != null
        assert Twit.count() == 1

        params.id = twit.id

        controller.delete()

        assert Twit.count() == 0
        assert Twit.get(twit.id) == null
        assert response.redirectedUrl == '/twit/list'
    }

    */
}

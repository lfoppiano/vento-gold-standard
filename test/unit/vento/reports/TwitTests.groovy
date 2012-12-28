package vento.reports

import grails.test.mixin.TestFor
import org.vento.utility.VentoTypes

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Twit)
class TwitTests {

    void testValidation() {

        domain.twitterId = "myId"
        domain.query = "amazon"
        domain.text = "text sent by user"
        domain.type = VentoTypes.TESTING
        domain.validate()

        assert !domain.errors.hasErrors()
    }


    void testValidationWithIncorrectType() {

        domain.twitterId = "myId"
        domain.text = "twitter text"
        domain.query = "amazon"
        domain.type = "bao"
        domain.validate()

        assert domain.errors.hasErrors()
        assert domain.errors.errorCount == 1
        assert domain.errors.hasFieldErrors()
        assert domain.errors.getFieldError('type').getRejectedValue() == "bao"
    }
}

package vento.reports

import org.bson.types.ObjectId
import org.vento.utility.VentoTypes

public class Twit {
    ObjectId id

    String twitterId

    String text;
    String geo;

    String toUserIdStr;
    String source;

    String isoLanguageCode;

    String fromUserIdStr;
    String query;

    String fromUser;
    String score;

    String referenceScore;
    String createdAt;

    List scoreHistories

    //It can be TRAINING, TESTING, CLASSIFICATION (default when is empty or null)
    String type;

    //static hasMany = [scores: Score]

    static constraints = {
        geo nullable: true
        toUserIdStr nullable: true
        source nullable: true
        isoLanguageCode nullable: true
        fromUserIdStr nullable: true
        fromUser nullable: true
        score nullable: true
        referenceScore nullable: true
        createdAt nullable: true
        type nullable: true, inList: [
                VentoTypes.CLASSIFICATION,
                VentoTypes.TESTING,
                VentoTypes.TRAINING,
                VentoTypes.TRAINING_STORESET
        ]
    }

    static mapWith = "mongo"

    static mapping = {
        collection "reports"
        //cache true
    }

    static namedQueries = {
        queries {
            projections {
                distinct("query")
            }
        }

        queryClassification {
            queries()
            onlyClassification()
        }

        onlyClassification {
            eq 'type', VentoTypes.CLASSIFICATION
            not {
                eq 'score', null
            }
        }

        onlyTraining {
            eq 'type', VentoTypes.TRAINING
        }

        onlyTraining {
            eq 'type', VentoTypes.TESTING
        }

        byQuery { query ->
            eq 'query', query
            onlyClassification()
        }

        byQueryOnlyClassification { query ->
            eq 'query', query
            onlyClassification()
        }

        search { searchItem ->
            or {
                like 'text', "%${searchItem}%"
                like 'score', "%${searchItem}%"
                like 'referenceScore', "%${searchItem}%"
            }
            and {
                onlyClassification()
            }
        }

        searchOnlyClassification{ searchItem ->
            search(searchItem)
            onlyClassification()
        }

        byQueryAndSearch { query, searchItem ->
            byQuery(query)
            search(searchItem)
        }

        byType { type ->
            eq 'type', type
        }
    }
}

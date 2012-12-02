package vento.reports

import org.bson.types.ObjectId

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
    }

    static mapWith = "mongo"

    static mapping = {
        collection "reports"
        database "vento"
        //cache true
    }

    static namedQueries = {
        queries {
            projections {
                distinct("query")
            }
        }

        byQuery { query ->
            eq 'query', query
        }

        search { searchItem ->
            or {
                like 'text', "%${searchItem}%"
                like 'score', "%${searchItem}%"
                like 'referenceScore', "%${searchItem}%"
            }
        }

        byQueryAndSearch { query, searchItem ->
            byQuery(query)
            search(searchItem)
        }
    }
}

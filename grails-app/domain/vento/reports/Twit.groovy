package vento.reports

public class Twit {
    String id;

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

    static constraints = {
    }

    static mapWith = "mongo"

    static mapping = {
        collection "reports"
        database "vento"
    }

    static namedQueries = {
        queries {
            projections {
                distinct("query")
            }
        }
    }
}

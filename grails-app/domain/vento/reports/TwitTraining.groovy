package vento.reports

import org.bson.types.ObjectId

class TwitTraining {

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
        collection "training"
        database "vento"
        //cache true
    }
}

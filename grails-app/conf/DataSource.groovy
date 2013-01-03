// environment specific settings
environments {
    development {
        dataSource {
            username = "grails"
            password = "bao123"
            host = "linus.mongohq.com"
            port = 10054
            databaseName = "app10645215"
        }

        /*dataSource {
            host = "localhost"
            port = 27017
            databaseName = "vento"
        }*/
    }

    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
        }
    }

    production {
        dataSource {
            username = "grails"
            password = "bao123"
            host = "linus.mongohq.com"
            port = 10054
            databaseName = "app10645215"
        }
    }

    /*production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE"
            pooled = true
            properties {
                maxActive = -1
                minEvictableIdleTimeMillis = 1800000
                timeBetweenEvictionRunsMillis = 1800000
                numTestsPerEvictionRun = 3
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = true
                validationQuery = "SELECT 1"
            }
        }
    }*/
}

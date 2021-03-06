using System;
using DataLakeModels;
using ApplicationModels;
using Common;

namespace ConsoleApp.Commands {

    public static class MigrateCommand {

        public static void Migrate(Databases db) {
            switch (db) {
                case Databases.AnalyticsPlatform:
                    DatabaseOperations.Migrate<ApplicationDbContext>();
                    break;
                case Databases.LakeYouTubeData:
                    DatabaseOperations.Migrate<DataLakeYouTubeDataContext>();
                    break;
                case Databases.LakeYouTubeAnalytics:
                    DatabaseOperations.Migrate<DataLakeYouTubeAnalyticsContext>();
                    break;
                case Databases.LakeAdWords:
                    DatabaseOperations.Migrate<DataLakeAdWordsContext>();
                    break;
                case Databases.LakeLogging:
                    DatabaseOperations.Migrate<DataLakeLoggingContext>();
                    break;
                case Databases.LakeFacebook:
                    Jobs.Fetcher.Facebook.DatabaseInitializer.Init();
                    break;
                default:
                    throw new Exception("Invalid database");
            }
        }

        public static void MigrateApplication() {
            DatabaseOperations.Migrate<ApplicationDbContext>();
        }

        public static void MigrateDataLake() {
            DatabaseOperations.Migrate<DataLakeYouTubeDataContext>();
            DatabaseOperations.Migrate<DataLakeYouTubeAnalyticsContext>();
            DatabaseOperations.Migrate<DataLakeAdWordsContext>();
            DatabaseOperations.Migrate<DataLakeLoggingContext>();
        }

        public static void MigrateFacebook() {
            Migrate(Databases.LakeFacebook);
        }
    }
}

package Control;

import Entity.Executavel;
import Model.Data;
import Model.ExcelFile;
import fileManager.FileManager;
import sql.Database;

public class Controller {

    Integer enterprise;
    Integer year;

    public Controller(Integer enterprise, Integer year) {
        this.enterprise = enterprise;
        this.year = year;
    }
        

    public class connectDb extends Executavel {

        @Override
        public void run() {
            Database.setStaticObject(new Database(FileManager.getFile("sci.cfg")));
        }
    }

    public class monthlyTotals extends Executavel {

        @Override
        public void run() {
            Data.defineTypeTotals(enterprise, year,"DEBITO");
            Data.defineTypeTotals(enterprise, year,"CREDITO");
        }
    }
    
    public class monthlyDifferences extends Executavel {

        @Override
        public void run() {
            Data.createMonthDiferences();
        }
    }
    
    public class createExcelFile extends Executavel{

        @Override
        public void run() {
            ExcelFile.createExcelFile();
        }
        
    }
}

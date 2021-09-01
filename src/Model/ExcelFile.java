
package Model;

import JExcel.JExcel;
import fileManager.FileManager;
import java.io.File;


public class ExcelFile {
    private static File file = FileManager.getFile("Acompanhamento_Mensal_Template.xslx");
        
    public static boolean createExcelFile(){
        try {
            //Abrir template
            XSSFWorkbook wk = new XSSFWorkbook(file);           

            colarIdConfigs(wk.getSheet("Parâmetros Gerais"));
            transferirLctos(wk.getSheet("Dados"));

            //salvar
            //wk.close();
            return JExcel.saveWorkbookAs(System.getProperty("user.profile") + "/desktop/" + "Acompanhamento_mensal.xlsx", wk);
        } catch (Exception e) {
            throw new Error(e);
        }
    }
}

package Model;

import JExcel.JExcel;
import static Model.Data.totais;
import fileManager.FileManager;
import java.io.File;
import static monthly.accounting.followup.MonthlyAccountingFollowUp.*;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelFile {

    private static File file = FileManager.getFile("Acompanhamento_Mensal_Template.xlsx");

    /*
                 * Percorre todos mapas de contas
                 * -- Vai de 1 a 12
                 * ---- Coloca os valores de diferenca na coluna do mês (Será feito um calculo para descrobrir qual a coluna é de cada mes)
                 * Salva Excel
                 * 
                 * 
                 * Busca no banco de dados o saldo das contas no dia 31/12 do ano informado e do ano anterior
     */
    public static boolean createExcelFile() {
        try {
            //Abrir template
            XSSFWorkbook wk = new XSSFWorkbook(file);            
            XSSFSheet sheet = wk.getSheetAt(0);
            
            sheet.getRow(7).getCell(0).setCellValue(year);
            
            Integer[] line = new Integer[1];
            
            //Percorre todas as contas
            totais.get("DIFFS").forEach((account,years)->{
                
                XSSFRow row = sheet.getRow(line[0]);
                
                //Conta
                row.getCell(1).setCellValue(account);
                
                
                line[0]++;
            });

            //Salva na area de trabalho
            return JExcel.saveWorkbookAs(new File(System.getProperty("user.home") + "/desktop/" + "Acompanhamento_mensal.xlsx"), wk);
        } catch (Exception e) {
            throw new Error(e);
        }
    }
}

package Model;

import JExcel.JExcel;
import JExcel.Sheet;
import static Model.Data.totais;
import fileManager.FileManager;
import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.util.HashMap;
import static monthly.accounting.followup.MonthlyAccountingFollowUp.*;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFFormulaEvaluator;
import org.apache.poi.xssf.usermodel.XSSFSheet;

public class ExcelFile {

    private static File templateFile = FileManager.getFile("Acompanhamento_Mensal_Template.xlsx");

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
            //get desktop path
            String desktopPath = System.getProperty("user.home") + File.separator + "Desktop";

            //Set name of new file replacing 'Template' in the name of the template file with the year and enterprise
            String newFileName = templateFile.getName().replace("Template", year + "-" + enterprise);

            //Create new file
            File newFile = new File(desktopPath + File.separator + newFileName);

            //Copy template file to new file
            Files.copy(templateFile.toPath(), newFile.toPath());

            //Abrir new file
            Workbook wk = WorkbookFactory.create(newFile);
            Sheet s = new Sheet((XSSFSheet) wk.getSheetAt(0));

            //Define o ano
            s.getRange("A8").setCellValue(year);

            Integer[] line = new Integer[]{1};

            //Percorre todas as contas
            totais.get("DIFFS").forEach((account, years) -> {

                //Conta
                s.getRange("B" + (line[0] + 1)).setCellValue(account);

                //Percorre todos os meses
                for (int mes = 1; mes <= 12; mes++) {
                    //Preenche ano 1
                    s.getCell(line[0], 2 + mes + (mes - 1)).setCellValue(years.getOrDefault(year, new HashMap<>()).getOrDefault(mes, BigDecimal.ZERO).floatValue());
                    
                    //Preencher ano 3
                    s.getCell(line[0], 1 + mes + (mes - 1)).setCellValue(years.getOrDefault(year-1, new HashMap<>()).getOrDefault(mes, BigDecimal.ZERO).floatValue());

                }

                line[0]++;
            });
            
            //Calcula diferenças
            XSSFFormulaEvaluator.evaluateAllFormulaCells(wk);

            //Convert newFile to FileOutputStream
            FileOutputStream fos = new FileOutputStream(newFile);
            //Save newFile
            wk.write(fos);

            //Return true
            return true;            
        } catch (Exception e) {
            throw new Error(e);
        }
    }
}

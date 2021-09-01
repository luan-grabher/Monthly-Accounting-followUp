package Model;

import JExcel.JExcel;
import JExcel.Sheet;
import static Model.Data.totais;
import fileManager.FileManager;
import java.io.File;
import java.math.BigDecimal;
import java.util.HashMap;
import static monthly.accounting.followup.MonthlyAccountingFollowUp.*;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFormulaEvaluator;
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
            Sheet s = new Sheet(wk.getSheetAt(0));

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
            
            XSSFFormulaEvaluator.evaluateAllFormulaCells(wk);

            //Salva na area de trabalho
            return JExcel.saveWorkbookAs(new File(System.getProperty("user.home") + "/desktop/" + "Acompanhamento_Mensal_" + enterprise + "__" + year + ".xlsx"), wk);
        } catch (Exception e) {
            throw new Error(e);
        }
    }
}

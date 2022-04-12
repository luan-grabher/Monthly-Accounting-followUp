package Model;

import JExcel.JExcel;
import JExcel.Sheet;
import static Model.Data.totais;
import fileManager.FileManager;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.util.HashMap;

import com.aspose.pdf.internal.imaging.internal.Exceptions.Exception;

import static monthly.accounting.followup.MonthlyAccountingFollowUp.*;

import org.apache.poi.xssf.streaming.SXSSFCell;
import org.apache.poi.xssf.streaming.SXSSFFormulaEvaluator;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;

public class ExcelFile {
    private static SXSSFSheet s = null;

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
    public static boolean createExcelFile() throws IOException {
        try {
            //get desktop path
            String desktopPath = System.getProperty("user.home") + File.separator + "Desktop";

            //Set name of new file replacing 'Template' in the name of the template file with the year and enterprise
            String newFileName = templateFile.getName().replace("Template", year + "-" + enterprise);

            //Create new file
            File newFile = new File(desktopPath + File.separator + newFileName);
            //Output file stream
            FileOutputStream newFileFos = new FileOutputStream(newFile);

            //Copy template file to new file
            Files.copy(templateFile.toPath(), newFile.toPath());

            //Abrir new file
            SXSSFWorkbook wk = new SXSSFWorkbook(-1); // turn off auto-flushing and accumulate all rows in memory
            s = wk.getSheetAt(0); //get first sheet

            //get cell by 'A8' converting to range and set cell value to year
            getRange("A".charAt(0), 8).setCellValue(year);
            

            Integer[] line = new Integer[]{1};

            //Percorre todas as contas
            totais.get("DIFFS").forEach((account, years) -> {

                //Define celula da conta
                getRange("B".charAt(0), line[0] + 1).setCellValue(account);

                //Percorre todos os meses
                for (int mes = 1; mes <= 12; mes++) {
                    //Preenche ano 1
                    s.getRow(line[0]).getCell(2 + mes + (mes - 1)).setCellValue(years.getOrDefault(year, new HashMap<>()).getOrDefault(mes, BigDecimal.ZERO).floatValue());
                    
                    //Preencher ano 3
                    s.getRow(line[0]).getCell(1 + mes + (mes - 1)).setCellValue(years.getOrDefault(year-1, new HashMap<>()).getOrDefault(mes, BigDecimal.ZERO).floatValue());

                }

                //if line is divisor of 100, flush rows to disk
                if (line[0] % 100 == 0) {
                    try {
                        s.flushRows(100);
                        wk.write(newFileFos);
                        wk.dispose(); // dispose of all resources and flush all rows to disk
                    } catch (IOException e) {
                        throw new Exception("Erro ao liberar memória com as linhas: " + e.getMessage());
                    }
                }

                line[0]++;
            });
            
            //Calcula diferenças
            SXSSFFormulaEvaluator.evaluateAllFormulaCells(wk);

            //Salva novo arquivo
            wk.write(newFileFos);
            wk.dispose(); // dispose of all resources and flush all rows to disk

            //Return true
            return true;
        } catch (Exception e) {
            throw new Error(e);
        }
    }

    //Function 'getRange', receive SXSSFSheet, row and column (caractere) and return the range
    public static SXSSFCell getRange(char column, int row) {
        //convert column to number
        int columnNumber = column - ('A' + 1);
        //get row and column
        return s.getRow(row).getCell(columnNumber);
    }
}

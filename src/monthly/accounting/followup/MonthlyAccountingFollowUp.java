package monthly.accounting.followup;

import Control.Controller;
import Entity.Executavel;
import Executor.Execution;

import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.swing.JOptionPane;

public class MonthlyAccountingFollowUp {
    public static Integer year = 2021;
    public static Integer enterprise = 331;
    
    public static void main(String[] args) {
        try {    
            
            //Pega Empresa
            enterprise = Integer.valueOf(JOptionPane.showInputDialog("Qual o NÚMERO/CÓDIGO da empresa no ÚNICO?").replaceAll("[^0-9]", "0"));
            
            if(enterprise > 0){            
                //Pega Ano
                Integer nowYear = Calendar.getInstance().get(Calendar.YEAR);                
                year = (Integer) JOptionPane.showInputDialog(null, "Qual o ano da Pesquisa?", "Escolha o ano", JOptionPane.QUESTION_MESSAGE, null, new Integer[]{nowYear,nowYear-1,nowYear-2}, 0);
                                                                
                Controller c = new Controller(enterprise, year);
                
                Map<String, Executavel> runs = new LinkedHashMap<>();
                runs.put("Conectando ao banco de dados", c.new connectDb());
                runs.put("Buscando totais dos lctos mensais", c.new monthlyTotals());
                runs.put("Criando mapa de diferenças de credito-debito", c.new monthlyDifferences());
                runs.put("Criando arquivo excel com diferenças", c.new createExcelFile());
                
                
                Execution app =  new Execution("Template de Acompanhamento Contábil Mensal");
                app.setExecutionMap(runs);
                app.runExecutables();
                app.endExecution();                               
            }else{
                throw new Error("Empresa inválida!");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e, "Ocorreu um ERRO", JOptionPane.ERROR_MESSAGE);
        } catch (Error e){
            JOptionPane.showMessageDialog(null, "Erro: " + e.getMessage(), "Ocorreu um ERRO", JOptionPane.ERROR_MESSAGE);
        }
        
        System.exit(0);
    }    
    
}

package monthly.accounting.followup;

import java.util.Calendar;
import javax.swing.JOptionPane;

public class MonthlyAccountingFollowUp {
    public static Integer year = 2021;
    public static Integer enterprise = 0;

    
    public static void main(String[] args) {
        try {
            //Pega Empresa
            enterprise = Integer.valueOf(JOptionPane.showInputDialog("Qual o NÚMERO/CÓDIGO da empresa no ÚNICO?").replaceAll("[^0-9]", "0"));
            
            if(enterprise > 0){            
                //Pega Ano
                Integer nowYear = Calendar.getInstance().get(Calendar.YEAR);                
                year = (Integer) JOptionPane.showInputDialog(null, "Qual o ano da Pesquisa?", "Escolha o ano", JOptionPane.QUESTION_MESSAGE, null, new Integer[]{nowYear,nowYear-1,nowYear-2}, 0);

                System.out.println("Opção escolhida: " + year);
            }else{
                throw new Error("Empresa inválida!");
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e, "Ocorreu um ERRO", JOptionPane.ERROR_MESSAGE);
        } catch (Error e){
            JOptionPane.showMessageDialog(null, "Erro: " + e.getMessage(), "Ocorreu um ERRO", JOptionPane.ERROR_MESSAGE);
        }
    }
    
}

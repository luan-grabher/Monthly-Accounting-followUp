package monthly.accounting.followup;

import java.util.Calendar;
import javax.swing.JOptionPane;

public class MonthlyAccountingFollowUp {
    public static Integer year = 2021;
    public static Integer enterprise = 0;
    
    /**
     * MODELO DE MAPA DE CONTA
     * "338" = {
            "2020" = {

            },
            "2021" = {
                    1 = {
                            "debito" = 0,
                            "credito" = 0,
                            "diferenca" = 0
                    },
                    2 = {
                            "debito" = 0,
                            "credito" = 0,
                            "diferenca" = 0
                    },
                    3 = {
                            "debito" = 0,
                            "credito" = 0,
                            "diferenca" = 0
                    }
            }
        }
     */

    
    public static void main(String[] args) {
        try {           
            
            //Pega Empresa
            enterprise = Integer.valueOf(JOptionPane.showInputDialog("Qual o NÚMERO/CÓDIGO da empresa no ÚNICO?").replaceAll("[^0-9]", "0"));
            
            if(enterprise > 0){            
                //Pega Ano
                Integer nowYear = Calendar.getInstance().get(Calendar.YEAR);                
                year = (Integer) JOptionPane.showInputDialog(null, "Qual o ano da Pesquisa?", "Escolha o ano", JOptionPane.QUESTION_MESSAGE, null, new Integer[]{nowYear,nowYear-1,nowYear-2}, 0);

                System.out.println("Opção escolhida: " + year);
                /**
                 * Busca no banco:
                 * -- Total de débito de cada mês
                 * -- Total de credito de cada mês
                 * 
                 * Percorre todos totais de debito
                 * -- Se não tiver a conta no mapa de contas
                 * ---- Adiciona um mapa com os anos e meses para aquela conta
                 * -- Adiciona no mapa da conta naquele ano e mes o valor
                 * 
                 * Percorre todos totais de credito
                 * -- Se não tiver a conta no mapa de contas
                 * ---- Adiciona um mapa com os anos e meses para aquela conta
                 * -- Adiciona no mapa da conta naquele ano e mes o valor
                 * -- Faz a diferença entre debito e credito
                 * 
                 * Abre o arquivo Excel
                 * Troca a celula "ano" para o ano utilizado
                 * Percorre todos mapas de contas
                 * -- Vai de 1 a 12
                 * ---- Coloca os valores de diferenca na coluna do mês (Será feito um calculo para descrobrir qual a coluna é de cada mes)
                 * Salva Excel
                 * 
                 * 
                 * Busca no banco de dados o saldo das contas no dia 31/12 do ano informado e do ano anterior
                 */
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

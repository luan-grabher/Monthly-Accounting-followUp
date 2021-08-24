package Model;

import fileManager.FileManager;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import sql.Database;

public class Data {

    private static final String sqlMonthTotals = FileManager.getText(FileManager.getFile("sql/getAccountsMonthTotals.sql"));
    private static final Map<String, Map<Integer, Map<Integer, Map<Integer, BigDecimal>>>> totais = new HashMap<>();

    public static void defineTypeTotals(Integer enterprise, Integer year, String type) {
        totais.putIfAbsent(type, new HashMap<>());

        Map<String, String> swaps = new HashMap<>();
        swaps.put("year", year.toString());
        swaps.put("beforeYear", Integer.toString(year - 1));
        swaps.put("enterprise", enterprise.toString());
        swaps.put("accountType", type);

        List<Map<String, Object>> results = Database.getDatabase().getMap(sqlMonthTotals, swaps);

        results.forEach(result -> {
            Integer acc = Integer.valueOf(result.get("BD" + type).toString());

            //Se não tiver a conta, cria o mapa
            if (!totais.get(type).containsKey(acc)) {

                totais.get(type).put(acc, new HashMap<>());

                totais.get(type).get(acc).put(year, getMapMonths());
                totais.get(type).get(acc).put(year - 1, getMapMonths());
            }

            totais
                    .get(type) //Pega tipo DEBITO ou CREDITO
                    .get(acc) //Pega conta
                    .get(Integer.valueOf(result.get("ANO").toString())) //Pega ano
                    .put(
                            Integer.valueOf(result.get("MES").toString()), //Pega mes
                            new BigDecimal(result.get("SUM").toString()) //Coloca total no mes
                    );
        });       
    }

    /**
     * Retorna um mapa com os 12 meses
     */
    private static Map<Integer, BigDecimal> getMapMonths() {
        Map<Integer, BigDecimal> months = new HashMap<>();
        for (int i = 1; i <= 12; i++) {
            months.put(i, BigDecimal.ZERO);
        }

        return months;
    }
    
    /**
     * Cria um mapa com as diferenças dos meses
     */
    public static void createMonthDiferences(){
        Map<Integer, Map<Integer, Map<Integer, BigDecimal>>> debits = totais.get("DEBITO");
        Map<Integer, Map<Integer, Map<Integer, BigDecimal>>> credits = totais.get("CREDITO");
        
        
        totais.putIfAbsent("DIFFS", new HashMap<>());
        Map<Integer, Map<Integer, Map<Integer, BigDecimal>>> diferences = totais.get("DIFFS");
        
        diferences.putAll(debits);
        diferences.putAll(credits);
        
        
        /*Percorre todas as contas*/
        for (Map.Entry<Integer, Map<Integer, Map<Integer, BigDecimal>>> account : diferences.entrySet()) {
            Map<Integer, Map<Integer, BigDecimal>> years = account.getValue();
            
            /*percorre todos anos da conta*/
            for (Map.Entry<Integer, Map<Integer, BigDecimal>> year : years.entrySet()) {
                Map<Integer, BigDecimal> months = year.getValue();
                
                /*Percorre todos meses do ano*/
                for (Map.Entry<Integer, BigDecimal> month : months.entrySet()) {                    
                    
                    month.setValue(BigDecimal.TEN);
                }
            }
        }
        
        System.out.println("");
    }
}

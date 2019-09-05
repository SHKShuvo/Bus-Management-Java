/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import static javax.swing.WindowConstants.DISPOSE_ON_CLOSE;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author User
 */
public class InsertData extends JFrame{    
    private static String table_name;
    private static int col_no;
    private static String[] col_names;
    private String[] val;
    
    private JPanel jp = new JPanel();
    private JLabel[] jl;
    private JTextField[] jt;
    private JButton jb = new JButton("Insert");
    private JButton js = new JButton("Search");
    private JButton close_bttn = new JButton("Close");

    DBHandler ob1 = new DBHandler();
    DBHandler ob2 = new DBHandler();

    public InsertData(String table_name, int col_no, String[] col_names) {
        this.table_name = table_name;
        this.col_no = col_no;

        ob1.setConnection("bus", "root", "d@rk1995");
        ob2.setConnection("bus", "root", "d@rk1995");
        System.out.println(table_name + " " + col_no);

        setTitle("Insert data");
        setVisible(true);
        setSize(450, 400);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);

        jt = new JTextField[col_no + 1];
        jl = new JLabel[col_no + 1];
        val = new String[col_no + 1];

        int j = 20;

        for (int i = 0; i < col_no; i++) {
            jt[i] = new JTextField();
            jl[i] = new JLabel();

            jl[i].setBounds(10, j, 100, 30);
            jl[i].setText(col_names[i]);
            jt[i].setBounds(225, j, 160, 30);

            j += 40;
            
            add(jl[i]);
            add(jt[i]);
        }

        j += 50;
        jb.setBounds(10, j, 100, 35);
        js.setBounds(140, j , 100, 35);
        close_bttn.setBounds(280, j, 100, 35);
        add(jb);
        add(js);
        add(close_bttn);
        add(jp);

        jb.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                
                for (int i = 0; i < col_no; i++) {
                    val[i] = jt[i].getText();
                    System.out.println(jt[i].getText());
                }                
                ob1.insertData(table_name, val);            
            }
        });
        
        js.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                
                for (int i = 0; i < col_no; i++) { 
                    val[i] = jt[i].getText();
                    System.out.println(jt[i].getText());
                }                
                //ob2.searchData(table_name, col_names , val);
                
                ResultSet result = ob2.searchData(table_name, col_names , val);
                DatabaseApp1 a = new DatabaseApp1();
                DefaultTableModel model = (DefaultTableModel) a.data_table.getModel();
                model.setColumnCount(0);
                while(model.getRowCount() > 0){
                 for(int i = 0 ; i < model.getRowCount() ; i++){                
                   model.removeRow(i);
                  }
                } 
                ArrayList<String> col = ob1.columnName(result);
                
                 for(String cc : col){
                   //System.out.print(cc+" ");
                     model.addColumn(cc);                
                 }
                
                ArrayList<ArrayList<String>> records = ob1.getResult(result);
                
                for(int i = 0 ; i < records.size() ; i ++){
                   model.addRow(records.get(i).toArray());
                }
                a.data_table.repaint();
                
            }
        });

        close_bttn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dispose();
            }
        });
    }

    public static void main(String[] args) {
        InsertData t = new InsertData(table_name, col_no, col_names);
    }
    
}

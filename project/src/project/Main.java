/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project;

/**
 *
 * @author User
 */
public class Main {
    public static void main (String ar[]){
        //LogIn lg = new LogIn();
        //lg.setVisible(true);
        
        Splash sp = new Splash();
        sp.setVisible(true);
        DatabaseApp1 bms = new DatabaseApp1();
        
        try{
            for(int i=0; i<=100; i++){
              Thread.sleep(50);
              sp.loadingnum.setText(Integer.toString(i)+"%");
              sp.loadingbar.setValue(i);
              if(i==100){
                sp.setVisible(false);
                bms.setVisible(true);
              }
            }
        }catch(Exception e){
            
        }
        
    }
}

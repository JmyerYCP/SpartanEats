package edu.ycp.cs320.spartaneats.persist;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import edu.ycp.cs320.spartaneats.model.Account;
import edu.ycp.cs320.spartaneats.model.Drink;
import edu.ycp.cs320.spartaneats.model.Extras;
import edu.ycp.cs320.spartaneats.model.Item;

public class InitialData {
	public static List<Item> getItem() throws IOException {
		List<Item> ItemList = new ArrayList<Item>();
		ReadCSV readItems = new ReadCSV("items.csv");
		try {
			while (true) {
				List<String> tuple = readItems.next();
				if (tuple == null) {
					break;
				}
				Iterator<String> i = tuple.iterator();
				Item item = new Item();
				item.setItemId(Integer.parseInt(i.next()));				
				item.setItemName(i.next());
				item.setPrice(Double.parseDouble(i.next()));
				
				ItemList.add(item);
			}
			return ItemList;
		} finally {
			readItems.close();
		}
	}
	
	public static List<Drink> getDrink() throws IOException {
		List<Drink> drinkList = new ArrayList<Drink>();
		ReadCSV readDrinks = new ReadCSV("drinks.csv");
		try {
			while (true) {
				List<String> tuple = readDrinks.next();
				if (tuple == null) {
					break;
				}
				Iterator<String> i = tuple.iterator();
				Drink drink = new Drink();
				drink.setItemId(Integer.parseInt(i.next()));
				drink.setItemName(i.next());
				drink.setPrice(Double.parseDouble(i.next()));
				
				drinkList.add(drink);
			}
			return drinkList;
		} finally {
			readDrinks.close();
		}
	}
	public static List<Account> getAccount() throws IOException{
		List <Account> accountList = new ArrayList<Account>();
		ReadCSV readAccounts = new ReadCSV("accounts.csv");
		try {
			//autogenerated primary key for accounts table
			Integer accountId = 0;
			while(true) {
				List<String> tuple = readAccounts.next();
				if (tuple == null) {
					break;
				}
				Iterator<String> i = tuple.iterator();
				Account account = new Account();
				account.setUserName(i.next());
				account.setFirstName(i.next());
				account.setLastName(i.next());
				account.setStudentID(i.next());
				account.setPassword(i.next());
				account.setEmail(i.next());
				account.setPhoneNumber(i.next());
				account.setAdminStatus(i.next());
				//String.valueOf(i.next()); gives 
				account.setAccountId(Integer.parseInt(i.next()));
				account.setFlex(Double.parseDouble(i.next()));
				account.setDining(Double.parseDouble(i.next()));
				//Add Account
				accountList.add(account);
			}
			return accountList;
		}
		finally {
			readAccounts.close();
		}
	}
	public static List<Extras> getExtras() throws IOException {
		List<Extras> ExtraList = new ArrayList<Extras>();
		ReadCSV readExtras = new ReadCSV("extras.csv");
		try {
			while (true) {
				List<String> tuple = readExtras.next();
				if (tuple == null) {
					break;
				}
				Iterator<String> i = tuple.iterator();
				Extras extra = new Extras();
				extra.setItemId(Integer.parseInt(i.next()));				
				extra.setItemName(i.next());
				extra.setPrice(Double.parseDouble(i.next()));
				
				ExtraList.add(extra);
			}
			return ExtraList;
		} finally {
			readExtras.close();
		}
	}
	
}

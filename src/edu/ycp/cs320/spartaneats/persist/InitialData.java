package edu.ycp.cs320.spartaneats.persist;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import edu.ycp.cs320.spartaneats.model.Account;
import edu.ycp.cs320.spartaneats.model.Condiments;
import edu.ycp.cs320.spartaneats.model.Item;

public class InitialData {
	public static List<Item> getItem() throws IOException {
		List<Item> ItemList = new ArrayList<Item>();
		ReadCSV readItems = new ReadCSV("Items.csv");
		try {
			while (true) {
				List<String> tuple = readItems.next();
				if (tuple == null) {
					break;
				}
				Iterator<String> i = tuple.iterator();
				Item item = new Item();
	
				item.setItemType(i.next());
				item.setItemName(i.next());
				item.setPrice(Double.parseDouble(i.next()));
				item.setCondiments(i.next());
				item.setItemId(Integer.parseInt(i.next()));
				
				ItemList.add(item);
			}
			return ItemList;
		} finally {
			readItems.close();
		}
	}
	public static List<Condiments> getCondiment() throws IOException {
		List<Condiments> CondimentsList = new ArrayList<Condiments>();
		ReadCSV readCondiments = new ReadCSV("condiments.csv");
		try {
			while (true) {
				List<String> tuple = readCondiments.next();
				if (tuple == null) {
					break;
				}
				Iterator<String> i = tuple.iterator();
				Condiments Condiment = new Condiments();
	
				Condiment.setCondType(i.next());
				Condiment.setCondName(i.next());
				Condiment.setCondID(Integer.parseInt(i.next()));
				
				CondimentsList.add(Condiment);
			}
			return CondimentsList;
		} finally {
			readCondiments.close();
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
}

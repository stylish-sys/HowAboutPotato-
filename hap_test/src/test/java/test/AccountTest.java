package test;

import junit.framework.TestCase;

public class AccountTest extends TestCase {
		
	Account account;
	
	
	protected void setUp() throws Exception {
		account = new Account(10000);
	}

	protected void tearDown() throws Exception {
//		super.tearDown();
	}

	public void testAccount() {
//		fail("Not yet implemented");
	}

	public void testGetBalance() {
		assertEquals(10000, account.getBalance());
	}

	public void testWithdraw() {
		account.withdraw(1000);
		assertEquals(9000, account.getBalance());
	}

	public void testDeposit() {
		account.deposit(1000);
		assertEquals(11000, account.getBalance());
	}
}

package reception;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

import libs.BookingLibs3;
import libs.CheckInCustomerJDBC;


//---------------------Main Clas-------------------------
public class TodayCheckInGUI {
	
	JFrame frame;
	JTextField checkintxt;
	Object[]columnsName;
	JTable table;
	DefaultTableModel model;
	ArrayList<BookingLibs3>a1;
	
	public TodayCheckInGUI() {
		
		//----------------------Main Frmae---------------------------
		frame=new JFrame("Today's Check-In Customers");
		frame.setSize(1050,600);
		frame.setIconImage(Toolkit.getDefaultToolkit().getImage(getClass().getResource("hotel.png")));
		frame.setLocationRelativeTo(null);
		frame.setResizable(false);
		frame.setLayout(new BorderLayout());
		
		//---------------------Show Current Date------------------
		SimpleDateFormat dateformate=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String currentDate=dateformate.format(date);
		
		//-----------------------North Panel-----------------------
		JPanel northPanel=new JPanel();
		northPanel.setLayout(null);
		northPanel.setPreferredSize(new Dimension(100,100));
		northPanel.setBackground(new Color(0,0,0));
		frame.add(northPanel,BorderLayout.NORTH);
		
		JLabel checkinlbl=new JLabel("Arrived Date:");
		checkinlbl.setFont(new Font("Tahoma",Font.BOLD,25));
		checkinlbl.setForeground(Color.white);
		checkinlbl.setBounds(20,30,200,30);
		northPanel.add(checkinlbl);
		
		//------------North Panel Check-In TextField---------------------
		checkintxt=new JTextField();
		checkintxt.setEnabled(false);
		checkintxt.setText(currentDate);
		checkintxt.setFont(new Font("Tahoma",Font.BOLD,25));
		checkintxt.setBounds(200,30,200,30);
		northPanel.add(checkintxt);
		
		//----------------------Check-In Customer Table----------------------
		columnsName = new Object[8];
		columnsName[0] = "Customer ID";
		columnsName[1] = "Name";
		columnsName[2] = "Booking ID";
		columnsName[3] = "Check-In";
		columnsName[4] = "Check-Out";
		columnsName[5] = "Room ID";
		columnsName[6] = "Room Type";
		columnsName[7] = "Room Status";

		table = new JTable();
		model = (DefaultTableModel) table.getModel();
		model.setColumnIdentifiers(columnsName);

		updateTable();
		JScrollPane scroll1 = new JScrollPane(table);
		scroll1.setBounds(400,20,500,400);
		frame.add(scroll1, BorderLayout.CENTER);
		
		
		
		
		
		
		
		
		frame.setVisible(true);
		
	}
	
	//---------------------Check-In Customer Table-------------------
	public void updateTable() {
		a1 = new CheckInCustomerJDBC().view_all1();
		model.setRowCount(0);
		for (BookingLibs3 bookingLibs : a1) {
			Object tmpRow[] = { bookingLibs.getCustomer_ID(),
					bookingLibs.getName(),
					bookingLibs.getBooking_ID(),
					bookingLibs.getCheckIn(),
					bookingLibs.getCheckOut(),
					bookingLibs.getRoom_ID(),
					bookingLibs.getBooking_Type(),
					bookingLibs.getBooking_Status()

			};

			model.addRow(tmpRow);
		}
		table = new JTable(model);
		JTableHeader t2=table.getTableHeader();
		t2.setBackground(Color.black);
		t2.setForeground(Color.white);
		table.setFont(new Font("Tahoma", Font.PLAIN, 16));
		table.setSelectionBackground(Color.black);
		table.setSelectionForeground(Color.white);
		table.setRowHeight(30);
		table.getTableHeader().setFont(new Font("SansSerif", Font.BOLD, 18));

		
	}
	
	
	public static void main(String[]args) {
		new TodayCheckInGUI();
		
	}

}

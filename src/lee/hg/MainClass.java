package lee.hg;

import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.Locale;

public class MainClass {

	public static void main(String[] args) {
		LocalDate today = LocalDate.now();
		System.out.println(today.toString());
		System.out.println("year: " + today.getYear());
		System.out.println("month: " + today.getMonthValue());
		System.out.println("month: " + today.getMonth().getDisplayName(TextStyle.FULL, Locale.KOREA));
		System.out.println("day of Month: " + today.getDayOfMonth());
		System.out.println("day of Week: " + today.getDayOfWeek());
		System.out.println("day of Year: " + today.getDayOfYear());
		System.out.println("day of Week: " + today.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.KOREA));
		System.out.println("day of Week: " + today.getDayOfWeek().getDisplayName(TextStyle.SHORT, Locale.KOREA));
		System.out.println("day of Week: " + today.getDayOfWeek().getDisplayName(TextStyle.NARROW, Locale.KOREA));
		System.out.println("day of Week value: " + today.getDayOfWeek().getValue());
		
		
		
		
		
		LocalDate firstDayOfThisMonth = LocalDate.now().withDayOfMonth(1);
		int firstDayWeekday = firstDayOfThisMonth.getDayOfWeek().getValue();
		System.out.println("firstDayWeekday: " + firstDayWeekday);
		
		
		
		
		

		LocalDate lastDayOfThisMonth = LocalDate.now().withDayOfMonth(today.lengthOfMonth());
	}

}
